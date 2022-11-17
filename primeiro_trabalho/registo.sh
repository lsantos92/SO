#!/bin/bash
#registo.sh


#abertura do ficheiro necessario para o registo

database="database.txt"

while [ "$opcaoregi" != "0" ]
do

echo "-- M E N U  R E G I S T O --"
echo " "
echo "1 - Universidade"
echo "2 - Professor"
echo "3 - Estudante"
echo "4 - Disciplina"
echo "0 - Voltar ao Menu Principal"
echo " "
echo "Introduza a opção>"
read opcaoregi


case $opcaoregi in
  1)echo "Introduza o nome da universidade:"
    read nameuni
    echo "Introduza o codigo da universidade: "
    read coduni
    echo "Introduza o local da universidade: "
    read localuni
    echo "UNI:$coduni:$nameuni:$localuni" >> $database
    ;;
  2)echo "Insira o nome do Professor"
    read nameprof
    echo "Insira o codigo do Docente"
    read codprof
    echo "Insira o nome da disciplina que leciona"
    read disprof
    echo "Insira o nome da universidade onde leciona"
    read uniprof
    echo "PROF:$codprof:$nameprof:$disprof:$uniprof" >> $database
    ;;
  3)echo "Introduza o nome do aluno: "
    read alunoname
    echo "Introduza o numero do aluno: "
    read nraluno
    echo "Introduza a universidade do aluno: "
    read unialuno
    echo "Introduza o professor responsavel: "
    read profaluno
    echo "ALU:$nraluno:$alunoname:$unialuno:$profaluno" >> $database
    ;;
  4)echo "Introduza o codigo da disciplina"
    read coddis
    echo "Introduza o nome da Disciplina"
    read disnome
    echo "Introduza o ano da Disciplina"
    read disano
    echo "Introduza o semestre da Disciplina"
    read dissem
    echo "DIS:$coddis:$disnome:$disano:$dissem" >> $database
    ;;
  0)source main.sh #volta para o menu principal
    break;;
  *)echo "OPÇÃO INVALIDA, TENTE NOVAMENTE"
    read -p "[ENTER PARA CONTINUAR]"
    ;;

esac
done
