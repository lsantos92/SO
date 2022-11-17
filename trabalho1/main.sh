#!/bin/bash
#main.sh

#Este é o nosso menu de inicial onde mostramos todas as funcoes disponiveis, desde o registo á gestao da base de dados

#utilizamos um ciclo para apresentar constantemente o menu ate que a opçao escolhida escolha outro ficheiro para utilizar
while [ "$opcaomain" != "0" ]
do

echo "-- M E N U  P R I N C I P A L --"
echo " "
echo "1 - Registo/Editar "
echo "2 - Alterar Dados"
echo "3 - Vizualizar Dados"
echo "4 - Relatorios"
echo "5 - Gestão do(s) ficheiro(s) de Base de Dados"
echo "6 - ERASMUS"
echo "0 - Sair"
echo " "
echo "Introduza a opção> "
read opcaomain

#requer um inteiro

case $opcaomain in
  1) source registo.sh;;
  2) source alterar.sh;;
  3) source visualizar.sh;;
  4) source relatorio.sh;;
  5) source basedados.sh;;
  6) source erasmus.sh;;
  0) echo "Volte Sempre"
     exit;;
  *) echo "OPÇÃO INVALIDA, TENTE NOVAMENTE"
     read -p "[ENTER PARA CONTINUAR]"
     # pausa ate que prime o ENTER
    ;;

esac


done

#fim dos ciclos
