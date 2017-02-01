
#Lendo dados
anp = read.csv2(file="datasets/dados_anp2.csv", stringsAsFactors = FALSE)
str(anp)

#Transforando os dados
anp$PRECO_COMPRA=as.numeric(anp$PRECO_COMPRA)
##Verificando se a nulos
which(is.null(anp$PRECO_COMPRA))
###Não há nulos e sim vário NaN

#Questão 1.
#Faça o summary para entender a sua base.
summary(anp)

#Questão 2
#Quantos preços foram coletados?
#9096
(length(which(!is.na(anp$PRECO_COMPRA))))

#Questão 3. 
#Crie uma tabela com a frequência de postos por combústivel, atribua essa 
#tabela à variável “quantidade_postos”
##
#Tentei criar este dataframe dinaicamente, mas só consegui fazer isso com uma lista
# lst_combustivel=list()
# label_combustivel=c()
# frequecia_combustivel=data.frame()
# for(cmbtvl in unique(anp$COMBUSTIVEL)) {
#     lst_combustivel = c(lst_combustivel,length(which(anp$COMBUSTIVEL==cmbtvl)))
#     label_combustivel = c(label_combustivel, cmbtvl)
# }
# names(lst_combustivel)<-label_combustivel


frequecia_combustivel=data.frame("Gasolina"=length(which(anp$COMBUSTIVEL=="Gasolina")), 
                                 "GNV"=length(which(anp$COMBUSTIVEL=="GNV")),
                                 "Etanol"=length(which(anp$COMBUSTIVEL=="Etanol")),
                                 "Diesel"=length(which(anp$COMBUSTIVEL=="Diesel")),
                                 "Diesel S10"=length(which(anp$COMBUSTIVEL=="Diesel S10")))


#Questão 4. 
#Qual combustível teve menos preços coletados? Isso faz sentido?
#GNV, sim faz sentio
frequecia_combustivel


#Questão 5. 
#Qual é o posto com menor preço de venda? É confiável essa fonte 
#(dica: olhe para o fornecedor e a bandeira.)
#Auto Posto Ml de Ana Neri Ltda.  Não conheço a bandeira (Branca)
(anp[which(anp$PRECO_VENDA==min(anp$PRECO_VENDA)), c("RAZAO_SOCIAL","PRECO_VENDA", "BANDEIRA")])


#Questão 6. 
#Crie a tabela dados_etanol, que é um filtro do data frame anp. 
#Sumarize dados_etanol por UF e  média dos preços de venda do etanol.


sumarize_etanol<-function(dados) {
  lst_estados=aggregate(dados,list(UF=dados$UF),FUN="mean")
  return(data.frame("UF"=lst_estados$UF, "Média_Preço"=lst_estados$PRECO_VENDA))
}
dados_etanol=anp[which(anp$COMBUSTIVEL=="Etanol"),]
etanol_sumarizado=sumarize_etanol(dados_etanol)


#Questão 7. 
#Qual é o estado com a menor média de preços de venda do etanol. Isso faz sentido?
#SP,  talvez si, pois deve ter mais concorrência e custos de frete, carga tributária 
#mais baratas
(etanol_sumarizado[which(etanol_sumarizado$Média_Preço==
                           min(etanol_sumarizado$Média_Preço)),'UF'])




#Questão 8. 
#Exporte para o mesmo arquivo em excel os data frames:
# • anp
# • dados_etanol
# • etanol_sumarizado
install.packages("xlsx")
library(xlsx)
write.xlsx(dados_etanol,file="resposta-exercicio-03.xlsx",sheetName="Dados Etanol",row.names=FALSE)
write.xlsx(etanol_sumarizado,file="resposta-exercicio-03.xlsx",sheetName="Dados Etanol Sumarizado",row.names=FALSE)
write.xlsx(anp,file="resposta-exercicio-03.xlsx",sheetName="ANP",row.names=FALSE)

#Lendo dados
anp = read.csv2(file="datasets/dados_anp2.csv", stringsAsFactors = FALSE)
str(anp)

#Transforando os dados
anp$PRECO_COMPRA=as.numeric(anp$PRECO_COMPRA)
##Verificando se a nulos
which(is.null(anp$PRECO_COMPRA))
###Não há nulos e sim vário NaN

#Questão 1.
#Faça o summary para entender a sua base.
summary(anp)

#Questão 2
#Quantos preços foram coletados?
#9096
(length(which(!is.na(anp$PRECO_COMPRA))))

#Questão 3. 
#Crie uma tabela com a frequência de postos por combústivel, atribua essa 
#tabela à variável “quantidade_postos”
##
#Tentei criar este dataframe dinaicamente, mas só consegui fazer isso com uma lista
# lst_combustivel=list()
# label_combustivel=c()
# frequecia_combustivel=data.frame()
# for(cmbtvl in unique(anp$COMBUSTIVEL)) {
#     lst_combustivel = c(lst_combustivel,length(which(anp$COMBUSTIVEL==cmbtvl)))
#     label_combustivel = c(label_combustivel, cmbtvl)
# }
# names(lst_combustivel)<-label_combustivel


frequecia_combustivel=data.frame("Gasolina"=length(which(anp$COMBUSTIVEL=="Gasolina")), 
                                 "GNV"=length(which(anp$COMBUSTIVEL=="GNV")),
                                 "Etanol"=length(which(anp$COMBUSTIVEL=="Etanol")),
                                 "Diesel"=length(which(anp$COMBUSTIVEL=="Diesel")),
                                 "Diesel S10"=length(which(anp$COMBUSTIVEL=="Diesel S10")))


#Questão 4. 
#Qual combustível teve menos preços coletados? Isso faz sentido?
#GNV, sim faz sentio
frequecia_combustivel


#Questão 5. 
#Qual é o posto com menor preço de venda? É confiável essa fonte 
#(dica: olhe para o fornecedor e a bandeira.)
#Auto Posto Ml de Ana Neri Ltda.  Não conheço a bandeira (Branca)
(anp[which(anp$PRECO_VENDA==min(anp$PRECO_VENDA)), c("RAZAO_SOCIAL","PRECO_VENDA", "BANDEIRA")])


#Questão 6. 
#Crie a tabela dados_etanol, que é um filtro do data frame anp. 
#Sumarize dados_etanol por UF e  média dos preços de venda do etanol.


sumarize_etanol<-function(dados) {
  lst_estados=aggregate(dados,list(UF=dados$UF),FUN="mean")
  return(data.frame("UF"=lst_estados$UF, "Média_Preço"=lst_estados$PRECO_VENDA))
}
dados_etanol=anp[which(anp$COMBUSTIVEL=="Etanol"),]
etanol_sumarizado=sumarize_etanol(dados_etanol)


#Questão 7. 
#Qual é o estado com a menor média de preços de venda do etanol. Isso faz sentido?
#SP,  talvez si, pois deve ter mais concorrência e custos de frete, carga tributária 
#mais baratas
(etanol_sumarizado[which(etanol_sumarizado$Média_Preço==
                           min(etanol_sumarizado$Média_Preço)),'UF'])




#Questão 8. 
#Exporte para o mesmo arquivo em excel os data frames:
# • anp
# • dados_etanol
# • etanol_sumarizado
install.packages("xlsx")
library(xlsx)
write.xlsx(dados_etanol,file="resposta-exercicio-03.xlsx",sheetName="Dados Etanol",row.names=FALSE)
write.xlsx(etanol_sumarizado,file="resposta-exercicio-03.xlsx",sheetName="Dados Etanol Sumarizado",row.names=FALSE)
write.xlsx(anp,file="resposta-exercicio-03.xlsx",sheetName="ANP",row.names=FALSE)

