
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
lst_combustivel=list()
label_combustivel=c()
frequecia_combustivel=data.frame()
for(cmbtvl in unique(anp$COMBUSTIVEL)) {
    lst_combustivel = c(lst_combustivel,length(which(anp$COMBUSTIVEL==cmbtvl)))
    label_combustivel = c(label_combustivel, cmbtvl)
}
names(lst_combustivel)<-label_combustivel
frequecia_combustivel<-as.data.frame(lst_combustivel)
str(frequecia_combustivel)

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



#Questão 6. 
#Crie a tabela dados_etanol, que é um filtro do data frame anp. 
#Sumarize dados_etanol por UF e  média dos preços de venda do etanol.

#Questão 7. 
#Qual é o estado com a menor média de preços de venda do etanol. Isso faz sentido?


#Questão 8. 
#Exporte para o mesmo arquivo em excel os data frames:
# • anp
# • dados_etanol
# • etanol_sumarizado
