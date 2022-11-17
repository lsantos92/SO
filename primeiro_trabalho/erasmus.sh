#!/bin/sh
#erasmus.sh
database="database.txt"
erasmus="erasmusfile.txt"
echo "-- M E N U  E R A S M U S --"                                   #menu utilizado para fazer o registo de um aluno de erasmus caso nao exista podemos criar um novo
echo " "
echo "Deseja registar novo aluno(1) ou seleccionar um já existente(2)?"
echo " "
echo "Voltar ao Menu Principal (0)"
read opcaoeras

case $opcaoeras in
   1)echo "Introduza o nome do aluno: "                             #menu utilizado para atribuir disciplinas ao aluno mas tambem para introduzirmos o ano e o semestre
     read nome                                                        #em que este chega
     echo "Introduza o numero do aluno: "
     read numero
     echo "Introduza a universidade do aluno: "
     read uni
     echo "Introduza o professor responsavel: "
     read prof
     echo "ALU:$numero:$nome:$uni:$prof" >> $database
     read -p "[ENTER PARA CONTINUAR]"
     grep -e "ALU" $database
     echo "Introduza o numero de aluno que pretende utilizar: "
     read idaluno
     echo "Introduza o ano de chegada:"
     read ano
     echo "Introduza o semestre:"
     read semes
     grep -e "UNI" $database
     echo "Introduza o ID da Universidade: "
     read uni
     grep -e "DIS" $database
     echo "Introduza o ID das Disciplinas separadas por ':'"
     read iddis
     echo "$idaluno:$ano:$semes:$uni:$iddis" >> $erasmus
    ;;
   2)grep -e "ALU" $database
     echo "Introduza o numero de aluno que pretende utilizar: "         #caso o aluno ja esteja criado basta selecionar o id do aluno e introduzir os valores pedidos
     read idaluno
     echo "Introduza o ano de chegada:"
     read ano
     echo "Introduza o semestre:"
     read semes
     grep -e "UNI" $database
     echo "Introduza o ID da Universidade: "
     read uni
     grep -e "DIS" $database
     echo "Introduza o ID das Disciplinas separadas por ':'"  #tentei guardar os valores(id da disciplina) num ficheiro com array, mas infelizmente tem que ser submetido em conjunto separado por ":"
     read iddis                                                 #por ex: 12312:123124:24211
     echo "$idaluno:$ano:$semes:$uni:$iddis" >> $erasmus
    ;;
    0)source main.sh
    break;;
    *)echo "OPÇÃO INVALIDA, TENTE NOVAMENTE"
      read -p "[ENTER PARA CONTINUAR]"
      ;;
esac
