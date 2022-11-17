#include "cs.h"
#include <string.h>

typedef struct mensagem
{
    int id;
    char conteudo[32];
    struct mensagem * nseg;
    struct mensagem * nant;
} mensagem;


typedef struct nodo
{
    int id;
    struct mensagem * head;
    struct nodo * nseg;
    struct nodo * nant;
} nodo;

nodo * criaNodo () {
    struct nodo*nv;
    nv=(nodo*)malloc(sizeof(nodo));
    nv->nseg=NULL;
    nv->nant=NULL;
    return(nv);
}

mensagem * criaMensagem () {
    struct mensagem * nm;
    nm=(mensagem*)malloc(sizeof(mensagem));
    nm->nseg=NULL;
    nm->nant=NULL;
    return (nm);
}

mensagem * insereMensagemFim (mensagem * l, mensagem * nm) {
    mensagem * aux=l;
    if (l==NULL)
        return nm;
    while(aux->nseg!=NULL)
	    aux=aux->nseg;

        aux->nseg=nm;
	    nm->nant=aux;
	    nm->nseg=NULL;


    return (l);
}

nodo * insereFim (nodo *l, nodo*nv){
    nodo * aux=l;
    if (l==NULL)
        return nv;
    while(aux->nseg!=NULL)
        aux=aux->nseg;

    aux->nseg=nv;
    nv->nant=aux;
    nv->nseg=NULL;

    return (l);
}

mensagem * deletaMensagem (mensagem * l, mensagem * r)
{
    if(r==l)
        l=l->nseg;
    if(r->nant!=NULL)
        r->nant->nseg=r->nseg;
    if(r->nseg!=NULL)
        r->nseg->nant=r->nant;
    r->nant=NULL;
    r->nseg=NULL;
    free(r);
    return (l);
}


//extrai os numeros em string e converte e insere num array de int
int *splitbuffer(char buff[MAXBUFF],int *tamanho)
{
    int *array;
    array=(int *)malloc(sizeof(int));
    int length=0;
    char *aux;

    aux=strtok(buff, ",");
    while(aux && length != 3)
    {
        array[length]=atoi(aux);
        array=(int *)realloc(array,++length*sizeof(int));
        aux=strtok(NULL, ",");
    }

    *tamanho=length;

    return array;
}


//funccao que extrai a string quando o comando for para inserir mensagem
char *fourthString(char *nome)
{

    char *primeiro = strtok(nome,",");
    char *segundo = strtok(NULL,",");
    char *terceiro = strtok(NULL,",");
    char *quarto = strtok(NULL,",");

    if(terceiro == NULL)
        printf("A string nao contem 4\n");

    return quarto;
}


//funcao para imprimir a lista
void printLista(mensagem * L)
{

    mensagem * aux = L;

    while (aux != NULL)
    {
	      printf("%s \n",aux->conteudo);
	      aux = aux->nseg;

    }
}

void printListamensagem(mensagem * L)
{

    mensagem * aux = L;

    while (aux != NULL)
    {
          printf("%d \n",aux->id);
          aux = aux->nseg;

    }
}

// void printListaid(,mensagem * L,int lid,int mid)
// {

//     mensagem * aux = L;

//     while (aux != NULL)
//     {
//         if(aux->id == mid && m)
//         {
//           printf("%d \n",aux->id);

//         }
//         aux = aux->nseg;

//     }
// }

// void print_msg(mensagem *L)
// {
// 	mensagem *aux =L;
// 	while(aux != NULL)
// 	{
// 		printf("%s \n",aux -> conteudo);
// 		aux=aux->nseg;
// 	}
// }



int server(int readfd, int writefd)
{

	char  buff[MAXBUFF];
	char  errmesg[256];
	int   n, fd,i;
	extern int errno;
    nodo * lista =NULL;

    for (i=0;i<10; i++)
    {
        nodo * nv;
        nv = criaNodo();
        nv->id=i;
        nv->head=NULL;
        lista=insereFim(lista,nv);
    }



    while(1)
    {

    //aux 2 cria uma copia do buffer

    char *aux2;
    aux2=(char *)malloc(MAXBUFF*sizeof(char));

	 /* Read the filename from the IPC descriptor */

	if ((n = read(readfd, buff, MAXBUFF)) != MAXBUFF)
	{

		err_sys("Server: filename read error!");

	}
    memset(aux2,'\0',MAXBUFF);
    strcpy(aux2,buff);
    int tamanho=0;
    int *a; //array que ira receber a string de numeros e converter em um array de int
    a=splitbuffer(aux2,&tamanho);//funcao que faz um array de int com os 3 primeiros elementos da string



    if(a[0]==1)
    {

        char *c; // string que recebe o quarto elemento do input
        c=fourthString(buff); // funcao extrai o quarto elemento
        nodo * aux = lista;

        while(aux!=NULL)
        {
            if(a[1]==aux->id)
            {
                mensagem  *novaMesg= criaMensagem();
                novaMesg->id=a[2];

                for (int i = 0; i < strlen(c) ;i++)
                {
                    novaMesg->conteudo[i]=c[i];

                }


                aux->head=insereMensagemFim(aux->head,novaMesg);
                break;

            }
            aux=aux->nseg;

        }

        fprintf(stderr, "1-Comando executado\n");

	    printLista(aux->head);


        memset(buff,'\0',MAXBUFF);
        strcat(buff, "Mensagem inserida\n");
        n = strlen(buff);
        write(writefd, buff, n);


    }

    if(a[0]==2)
    {
        nodo *aux=lista;
        while(aux->id!=a[1])
        {
            aux=aux->nseg;
        }

        if(aux->head==NULL)
        {
            memset(buff,'\0',MAXBUFF);
            strcat(buff, "Nao tem mensagem para apagar\n");
            n=strlen(buff);
            write(writefd,buff,n);
        }

        else
        {
            mensagem * maux=aux->head;

            while(aux!=NULL)
            {
                if(maux->id==a[2])
                {
                    aux->head=deletaMensagem(aux->head,maux);
                    memset(buff,'\0',MAXBUFF);
                    strcat(buff, "Mesagem apagada com sucesso\n");
                    n = strlen(buff);
                    write(writefd,buff,n);
                    break;
                }

                else
                {
                    maux=maux->nseg;
                }

                if(maux==NULL)
                {
                    memset(buff,'\0',MAXBUFF);
                    strcat(buff, "mensagem inexistente\n");
                    n = strlen(buff);
                    write(writefd,buff,n);
                }
            }


    }

    fprintf(stderr, "2-Comando executado\n");
    printLista(aux->head);


}
    if(a[0]==3)
    {
         nodo *aux=lista;
        while(aux->id!=a[1])
        {
            aux=aux->nseg;
        }

        if(aux->head==NULL)
        {
            memset(buff,'\0',MAXBUFF);
            strcat(buff, "Nao existe\n");
            n=strlen(buff);
            write(writefd,buff,n);
        }

        else
        {
            mensagem * maux=aux->head;

            if(aux!=NULL)
            {
                printListamensagem(maux);

            }

            else
            {
               maux=maux->nseg;
            }


        }

        fprintf(stderr, "3-Comando executado\n");
        memset(buff,'\0',MAXBUFF);
        strcat(buff, "Mensagem Visualizada\n");
        n = strlen(buff);
        write(writefd, buff, n);


    }
    if(a[0]==0){
      exit(1);
    }


    else if (a[0]!=1)
    {

        if ((fd = open(buff, 0)) < 0)
    	{
    		/*
    		 * Error. Format an error message and send it back to the
    		 * client.
    		*/
    		sprintf(errmesg, ": can.t open, %s\n", sys_err_str());

    		strcat(buff, errmesg);

    		n = strlen(buff);


    		if (write(writefd, buff, n) != n)
    		{
    			err_sys("Server: errmesg write error!");

    		}
        }


	else
	{


    		/*
    		 * Read the data from the file and write to the IPC
    		 * descriptor.
    		*/

    		while ((n = read(fd, buff, MAXBUFF)) > 0)
    		{

    			if (write(writefd, buff, n) != n)
    			{

    				err_sys("Server: data write error!");

    			}
    		}

    		if (n < 0)
    		{

    			err_sys("Server: read error!");

    		}
	}

    }


}
	return 0;

}
