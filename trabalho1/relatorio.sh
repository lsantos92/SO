#!/bin/bash
#relatorio.sh
database="database.txt"
erasmus="erasmusfile.txt"

while [ "$opcaorela" != "0" ]
do

echo "-- M E N U  R E L A T O R I O --"                   #um menu que permite listar as relacoes existentes
echo "1 - Listar Universidade"
echo "2 - Listar Disciplinas e Respetivos Alunos"           # portanto no primeiro case apresenta tudo relacionado com a universidade desde os professores
echo "0 - Voltar ao Menu Principal"                         # que nesta lecionam, alunos que estudam na universidade em questao etc
echo "Introduza a opção> "
read opcaorela

case $opcaorela in
    1)grep -e "UNI" $database
      echo "Introduza o ID da Universidade: "
      read iduni
      echo " "
      nome=$(grep -e "$iduni" $database|cut -d: -f 3)
      grep -h "$nome" $database
      read -p "[ENTER PARA CONTINUAR]"
      ;;
    2)grep -e "DIS" $database
      echo "Introduza o ID da Disciplina:"
      read iddis
      echo " "
      nome=$(grep -e "$iddis" $database|cut -d: -f 3)
      grep -e "$iddis" $database
      echo "---------------------------"
      echo "Alunos inscritos na respetiva disciplina:"        #no segundo caso apresentamos os alunos inscritos a uma determinada disciplina
      aluno=$(grep -h "$iddis" $erasmus|cut -d: -f 1)
      echo " "
      grep -h "$aluno" $database| cut -d: -f{2,3,4}
      echo "---------------------------"
      read -p "[ENTER PARA CONTINUAR]"
      ;;
      0)source main.sh
      break;;
      *)echo "OPÇÃO INVALIDA, TENTE NOVAMENTE"
        read -p "[ENTER PARA CONTINUAR]"
      ;;

esac
done
