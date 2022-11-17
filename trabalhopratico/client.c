#include "cs.h"
int
client(int readfd, int writefd)
{

	char   buff[MAXBUFF];

	int    n;
	fprintf(stderr, "------------CLIENTE----------\n");
    fprintf(stderr, "Inserir -> 1,idFila,idMensagem,Conteudo\n");
    fprintf(stderr, "Eliminar -> 2,idFila,idMensagem\n");
    fprintf(stderr, "Visualizar -> 3,idFila\n");
		fprintf(stderr, "Sair -> 0\n");


	fgets(buff, MAXBUFF, stdin);
	n = strlen(buff);

	if (buff[n - 1] == '\n')
	{
		buff[n - 1] = '\0';	/* ignore newline from fgets() */
	}
	if (write(writefd, buff, MAXBUFF) != MAXBUFF) {
		err_sys("Client: filename write error!");
	}
	/* Read the data from the IPC descriptor and write to standard output */

	while ((n = read(readfd, buff, MAXBUFF)) > 0) {
		write(1, buff, n); //printa o output aka resposta do server

        fgets(buff, MAXBUFF, stdin); // le o comando do user
        n = strlen(buff);
        if (buff[n - 1] == '\n') { buff[n - 1] = '\0';    /* ignore newline from fgets() */}
        if (write(writefd, buff, MAXBUFF) != MAXBUFF) { //volta a mandar o comando para o server
            err_sys("Client: filename write error!");
        }
    }

	return 0;

}
