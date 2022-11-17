#!/bin/bash
#alterar.sh


database="database.txt"

while [ "$opcaoalterar" != "0" ]
do

echo "-- M E N U  A L T E R A R --"
echo " "
echo "1 - Universidade"
echo "2 - Professor"
echo "3 - Estudante"
echo "4 - Disciplina"
echo "0 - Voltar ao Menu Principal"
echo " "
echo "Introduza a opção>"
read opcaoalterar

case $opcaoalterar in
  1)grep -h "UNI" $database             # vai listar as linhas que contenham "UNI" uma sigla utilizada para distinguir universidades,professores,alunos e disciplinas no mesmo ficheiros
    read -p "[ENTER PARA CONTINUAR]"        #para a sua manipulacao ser mais facil
    echo "Introduza o ID da Universidade que pretende alterar:"
    read codigouni
    grep -e "UNI" $database | sed -i '' /$codigouni/d $database #acaba por apagar a linha inteira obrigando a que seja introduzido novos valores
    echo "-- Introduza novos valores --"
    echo " "
    echo "ID da Universidade: "
    read novocodigouni
    echo "Nome da Universidade: "
    read novonomeuni
    echo "Local da Universidade: "
    read novolocaluni
    echo " "
    echo "UNI:$novocodigouni:$novonomeuni:$novolocaluni" >> $database

    ;;
  2)grep -h "PROF" $database
    read -p "[ENTER PARA CONTINUAR]"
    echo "Introduza o ID do Professor que pretende alterar:"
    read codigoprof
    grep -e "PROF" $database | sed -i '' /$codigoprof/d $database
    echo "-- Introduza novos valores --"
    echo " "
    echo "ID do Professor"
    read novocodigoprof
    echo "Nome do Professor:"
    read novonomeprof
    echo "Disciplina que leciona:"
    read novadisciplinaprof
    echo "Universidade que leciona:"
    read novauniprof
    echo " "
    echo "PROF:$novocodigoprof:$novonomeprof:$novadisciplinaprof:$novauniprof" >> $database

    ;;
  3)grep -h "ALU" $database
    read -p "[ENTER PARA CONTINUAR]"
    echo "Introduza o nº do Aluno que pretende alterar:"
    read codigoalu
    grep -e "PROF" $database | sed -i '' /$codigoalu/d $database
    echo "-- Introduza novos valores --"
    echo " "
    echo "Numero de Aluno:"
    read novocodigoalu
    echo "Nome do Aluno:"
    read novonomealu
    echo "Nome da Universidade:"
    read novounialu
    echo "Professor responsável:"
    read novoprofalu
    echo " "
    echo "ALU:$novocodigoalu:$novonomealu:$novounialu:$novoprofalu" >> $database

    ;;
  4)grep -h "DIS" $database
    read -p "[ENTER PARA CONTINUAR]"
    echo "Introduza o codigo da disciplina que pretende alterar:"
    read codigodis
    grep -e "DIS" $database | sed -i '' /$codigodis/d $database
    echo "-- Introduza novos valores --"
    echo " "
    echo "ID da Disciplina:"
    read novocodigodis
    echo "Nome da Disciplina:"
    read novonomedis
    echo "Ano:"
    read novoanodis
    echo "Semestre:"
    read novosemdis
    echo " "
    echo "DIS:$novocodigodis:$novonomedis:$novoanodis:$novosemdis" >> $database

    ;;
  0)source main.sh
    break;;
  *)echo "OPÇÃO INVALIDA, TENTE NOVAMENTE"
    read -p "[ENTER PARA CONTINUAR]"
    ;;

esac

done
#unset variable limpa o valor guardado na variavel

#sed -i '' 's/oldstring/newstring/g' filename
