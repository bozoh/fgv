#======================================================================================================================#
#=================== GABARITOS           ===========================================================================#
#=================== PROFESSORA:ANNA CAROLINA BARROS  =================================================================#
#=================== AULA 1- Introdução ao R       =================================================================#
#======================================================================================================================#



##==============================================================================================#
#=================================CAP 7=========================================================#
##==============================================================================================#
#Gabarito 7.5. Exercicios
#Crie uma tabela, chamada de tabela_pessoas e responda as questões:

nome<-c("Paulo",	"Anna","Pedro",	"Viviane",	"Ricardo",	"Diego",	"Marcos","Renata","Victor","Bruno",	"Juliana",	"Adriana",	"Juliana",	"Beatriz","Vanessa",	"Ingrid","Mariana")
genero<-c(1	,2	,1	,2,	1	,1,	1,	2	,1	,1,	2,	2,	2,	2,	2	,1,2)
regiao<-c("Região 2",	"Região 3",	"Região 3",	"Região 2",	"Região 3","Região 5",	"Região 2",	"Região 5",	"Região 5",	"Região 1","Região 1","Região 1","Região 2","Região 1",	"Região 2",	"Região 3",	"Região 3")
idade<-c(36,32,	30,	32,	31,	29,	35,	33,	25,	27,	27,	19,	31,	22,	36,	34	,33)

tabelas_pessoas<-data.frame(nome,genero,regiao,idade)

#1. Quantas observações tem a tabela?

observacoes<-nrow(tabelas_pessoas)
observacoes

#2. Quais são as médias das idades?
media_idade<-mean(tabelas_pessoas$idade)
media_idade

#3. Quais são as classes de cada uma das colunas?
str(tabelas_pessoas)

# 4.Faça um resumo da tabela.
summary(tabelas_pessoas)

##==============================================================================================#
#=================================CAP 8=========================================================#
##==============================================================================================#

#Tome os vetores: nomes = [Anna, Paula,Roberta, Ingrid, fernanda, João],pesos = [52, 65, 70, 58, 48, 70] e
#alturas = [1.54, 1.76, 1.65, 1.60, 1.68, 1.70]. Criem uma lista com esses vetores chamado lista_pessoas.Depois
#crie um quarto objeto chamado IMC de acordo coma equação, depois responda as questões:

nomes = c("Anna", "Paula","Roberta", "Ingrid", "fernanda", "João")
pesos = c(52, 65, 70, 58, 48, 70)
alturas = c(1.54, 1.76, 1.65, 1.60, 1.68, 1.70)

lista_pessoas<-list(nomes=nomes,pesos=pesos,alturas=alturas)

lista_pessoas$IMC<-lista_pessoas$pesos/(lista_pessoas$alturas**2)

#2. Qual é o primeiro elemento da lista?
lista_pessoas[[1]]

#3. Quais são as classes dos objetos na lista?

str(lista_pessoas)

#4. Qual é o maior IMC?

maior_imc<-max(lista_pessoas$IMC)
maior_imc

##==============================================================================================#
#=================================CAP 11=========================================================#
##==============================================================================================#
#1. Crie uma função que calcule a área e o perímetro de um triângulo retângulo, com os as entradas:
#====>a. Cateto 1
#====>b. Cateto 2
#O output será uma lista com o primeiro ojeto sendo a àrea e o segundo sendo o perímetro.

triangulo<-function(c1,c2){
  
  h<-sqrt(c1**2+c2**2)
  area=c1*c2/2
  perimetro=c1+c2+h
  
  
  return(list(area=area,perimetro=perimetro))
  
}

#Exemplo: Aplicando a função em um triangulo com c1=4 e c2=3
triangulo(3,4)

