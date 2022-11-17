#!/bin/sh
#basedados.sh

#abertura dos ficheiros necessarios para a manipulacao e gerenciamento da nossa base dados


erasmus="erasmusfile.txt"
database="database.txt"

 while [ "$opcaodatabase" != "0" ]
 do

echo "[-- M E N U  D A T A B A S E --]"
echo " "
echo "1 - Criar cópia de segurança"
echo "2 - Restaurar cópia de segurança"
echo "3 - Apagar cópia de segurança"
echo "0 - Voltar ao Menu Principal"
echo " "
echo "Introduza a opcão>"
read opcaodatabase

case $opcaodatabase in
	1) mkdir Backup
	cp $database "/$PWD/Backup"    #os ficheiros txt sao copiados para uma pasta "Backup" e seguidamente comprimidos num ficheiro .tar.gz
  cp $erasmus "/$PWD/Backup"
	tar -cjf Backup.tar.gz "Backup"
	rm -rf "/$PWD/Backup"              #a pasta Backup é eliminada visto ja nao ser precisa
	echo "Backup efetuado com sucesso!";;

	2)tar -xjf Backup.tar.gz
	  echo "Restauro efetuado com sucesso";; #vai descomprimir a pasta comprimida

	3)rm -rf "$PWD/Backup.tar.gz"
	  rm -rf "$PWD/Backup"                       #elimina a copia de seguranca criada anteriormente
	  echo "Copia de Segurança eliminada com sucesso";;
	0) source main.sh;;
esac

done

#fim do ciclo
