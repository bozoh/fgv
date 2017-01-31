#Lendo os dados
idh = read.csv(file="datasets/Human development index (HDI).csv", sep=";")
str(idh)
idh$Country = trimws(x=as.character(idh$Country))
#Questão 1
#Crie uma função que classifique os países 
#(em uma coluna extra na tabela) em 2014 de acordo com a Tabela
(cut(idh$Ano_2014, breaks = c(0,0.534,0.710,0.796,Inf), labels = c("Baixo", "Médio", "Alto", "Muito Alto")))

classificador_idh=function(dados) {
  return(cut(dados$Ano_2014, breaks = c(0,0.534,0.710,0.796,Inf), labels = c("Baixo", "Médio", "Alto", "Muito Alto")))
}

idh$Ano_2014_classificado = classificador_idh(idh)

#Questão 2
# Qual pais cresceu mais em relação à 2013?
#Togo
(idh[which((idh$Ano_2014 -idh$Ano_2013 )==max((idh$Ano_2014 -idh$Ano_2013 ))), "Country"]) 

#Questão 3
#Qual pais caiu mais em relação à 2013?
#Libya
(idh[which((idh$Ano_2014 -idh$Ano_2013 )==min((idh$Ano_2014 -idh$Ano_2013 ))), "Country"]) 

#Questão 4
#Quantos enstão com classificação baixa?
#40
(length(which(idh$Ano_2014_classificado == "Baixo")))

#Questão 5
#Qual é a posição do Brasil?
#75
(idh[which(idh$Country=="Brazil"), "HDI.Rank"])



