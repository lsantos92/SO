#!/bin/bash
#visualizar.sh

database="database.txt"                 #neste menu simplesmente apresentamos todos os dados contigos no ficheiro database.txt
while [ "$opcaovi" != "0" ]             #alunos universidades disciplinas professores registados na database.txt
do

echo "[ U N I V E R S I D A D E S]"
echo " "
echo "SIGLA:ID:NOME:LOCAL"
echo " "
grep "UNI" $database
echo "-----------------"
echo "[ P R O F E S S O R E S]"
echo " "
echo "SIGLA:ID:NOME:DISCIPLINA:UNIVERSIDADE"
echo " "
grep "PROF" $database
echo "-----------------"
echo "[ A L U N O S]"
echo " "
echo "SIGLA:ID:NOME:UNIVERSIDADE:PROF RESPONSAVEL"
echo " "
grep "ALU" $database
echo "-----------------"
echo "[ D I S C I P L I N A S]"
echo " "
echo "SIGLA:ID:NOME:ANO:SEMESTRE"
echo " "
grep "DIS" $database
echo "-----------------"
echo "0 - Voltar ao Menu Principal"
read opcaovi



done

source main.sh
