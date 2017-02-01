
#Carregando os dados
titanic=read.csv(file="datasets/train.csv")
summary(titanic)

#Formatando os dados
titanic[["Pclass"]]=factor(titanic[["Pclass"]])
titanic[["Name"]]=as.character(titanic[["Name"]])
summary(titanic)

#Questão 1
#Quantas variaveis o arquivo possui?
#12
ncol(titanic)

#Quantas observações o arquivo possui?
#891
nrow(titanic)

#ou str(titanic), que vem com as duas informações 
#na primeira linha


#Questão 2
#Quais são as classes das variaveis?

#PassengerId: int  
#Survived   : int  
#Pclass     : Factor w/ 3 levels ####ALTERADO na formatação de datos, pois o original era int
#Name       : chr  ####ALTERADO na formatação de datos, pois o original era factor
#Sex        : Factor w/ 2 levels 
#Age        : num
#SibSp      : int  
# Parch      : int
# Ticket     : Factor w/ 681 levels 
# Fare       : num  7.25 71.28 7.92 53.1 8.05 ...
# Cabin      : Factor w/ 148 levels
# Embarked   : Factor w/ 4 levels
str(titanic)

#Questão 3
#Quais são o preço médios dos tickets?

#Tenho que ignorar qualquer menor ou igual a zero
mean(titanic[which(titanic$Fare > 0),"Fare"])
#R. 32.75565
      
#Questão 4
#Crie dois data_frame um com gênero masculino e outro com gênero feminino
titanic_masculino<-titanic[which(titanic$Sex =='male'),]
titanic_feminino<-titanic[which(titanic$Sex =='female'),]

#Questão 5
# Crie duas listas uma para informações do data frame do genero feminino e outro para o genero
# masculino. Cada lista deve ser composta:
# •Número total de Passageiros
# •Número de Sobreviventes
# •Numero de passageiros na primeira classe
# •Preço do ticket ????  deve ser a média  pois as demais infos são agrupadas
# •Numero de parentes\filhos

cria_lista=function(dados) {
  total_passageiro = nrow(dados)
  sobreviventes = length(which(dados$Survived==1))
  num_primeira_classe = length(which(dados$Pclass==1))
  media_preco_ticket = mean(dados[which(dados$Fare > 0),"Fare"])
  parentes = sum(dados$SibSp) + sum (dados$Parch)
  return(list("total_passageiro"=total_passageiro, "sobreviventes"=sobreviventes, 
              "num_primeira_classe"=num_primeira_classe, "media_preco_ticket"= media_preco_ticket, 
              "parentes"=parentes))
}
lista_feminino=cria_lista(titanic_feminino)
lista_masculino=cria_lista(titanic_masculino)

str(lista_feminino)
str(lista_masculino)


#Questão 6 
#Qual gênero teve o maior número de pessoas embarcadas?
#Masculino

#Questão 7
#Qual genero sobreviveu mais?
#Feminino

#Questão 8
#Qual genero teve a maior média do número de parentes?
#Feminino
(media_parente_feminino=lista_feminino$parentes/lista_feminino$total_passageiro)
#1.343949
(media_parente_masculino=lista_masculino$parentes/lista_masculino$total_passageiro)
#0.6655113



#titanic[which(titanic$SibSp==5),]
#titanic[grep('^Goodwin.*?',titanic$Name, perl = T),]
titanic$Fare_class<-cut(titanic$Fare, breaks = c(0,7.91,14.45,31,512.33), labels=c("very cheap", "cheap","normal","expensive"))



