######Aluna: Maria Aldenise Xavier

####9. Tutoriais de Programa��o

media <-function(x)
{
  soma=sum(x)
  nobs=length(x)    #Cria uma fun��o "media"
  media=soma/nobs
  return(media)
}

##Testando a fun��o
ls() #Lista o nome dos objetos
media #Mostra a fun��o que foi aplicada para o objeto "media".
media() #Erro, pois nao definiu o nome do objeto.
dados=rnorm(20,2,1) #Cria uma sequencia numerica de 20 elementos com media=2 e desvio padrao= 1.
media(dados) #media do objeto "dados".
dados1=rnorm(200,2,1) #Cria uma sequencia numerica de 200 elementos com media=2 e desvio padrao= 1.
media(dados1) #Calcula a m�dia do objeto "dados1".
dados2=(rnorm(10000,2,1)) #Cria uma sequencia numerica de 10000 elementos com media=2 e desvio padrao= 1.
media(dados2) #Calcula a m�dia do objeto "dados2".
sd(dados) #Calcula o desvio padrao do objeto "dados".
dados3=rnorm(20,2,0.01)  #Cria uma sequencia numerica de 20 elementos com media=2 e desvio padrao= 0.01.
media(dados3) #Calcula media do objeto "dados3".
dados4=rnorm(200,2,0.01) #Cria uma sequencia numerica de 200 elementos com media=2 e desvio padrao= 0.01.
media(dados4) #Calcula media do objeto "dados4".
dados[2]<-NA #Coloque um "NA" na segunda posi��o da sequencia.
dados #Mostra a sequencia do objeto "dados" com o "NA" da segunda posi��o.
media(dados) #O R n�o calcula media com "NA".

#Uma fun��o mais elaborada
media<-function(x,rmNA=TRUE)  #Remove o "NA" quando existir (True)
{
  if(rmNA==TRUE)
  {
    dados=(na.omit(x)) #Se tiver "NA" omitir o valor na sequencia.
    n.NA=length(x)-length(dados) #Calcula o numero de "NA" retirados da sequencia.
    cat("\t", n.NA," valores NA exclu�dos\n") #Mostra uma mensagem quando o "NA" � detectado na sequencia.
  }
  else
  {
    dados=x
  }
  soma=sum(dados)
  nobs=length(dados)
  media=soma/nobs
  return(media)
}

media(dados) #Calcula a media do vetor dados, nesse caso � NA pois o R n�o roda media com "NA"

##Fun��o para calcular vari�ncia
var.curso<-function(x)
{
  media=media(x)
  dados=na.omit(x)	
  disvquad=(dados-media)^2
  var.curso=sum(disvquad)/(length(dados)-1)
  return(var.curso)
}

var.curso(dados) #Calcula a variancia do objeto "dados".
var(dados) ### dica: veja o help dessa fun��o "help(var)"
var(dados,na.rm=TRUE) #o valor de variancia quando o "NA" e removido.
var(dados,na.rm=FALSE) # O valor da variancia quando "NA" nao e removido.

help(var)

##Fun��o para calcular o �ndice de Dispers�o
ID.curso<-function(x)
{
  id=var.curso(x)/media(x)
  return(id)
}

##Simulando dados com par�metros conhecidos
###Simulando Aleat�rio
aleat=rpois(200,2) #sequencia aleatoria de 200 numeros com o valor 2 (parametro da fun��o Poinson)
aleat

###Uniforme
unif=runif(200,0,4) #sequencia de 200 numeros, sendo 0 o valor minimo e 4 o valor maximo.
unif
unif=round(unif,0) #a fun��o round aproxima para o valor inteiro mais proximo.
unif

###Agregado
agreg=round(c(runif(100,0,1),runif(100,5,10))) #Agrega os valores das sequencias (0-1) e (5-10) aproximando os valores para o numero inteiro mais proximo.
agreg

##Calcular o coeficiente de dispers�o
ID.curso(aleat)
ID.curso(unif)
ID.curso(agreg)

##Fun��o para criar o teste de signfic�ncia do ID
test.ID <- function(x, nsim=1000) #Cria a fun��o "test.ID" para criar o teste de significancia do ID.
{ 
  ID.curso=function(x){var(x)/mean(x)}# essa fun��o precisa das funcoes media e ID.curso
  dados=na.omit(x)
  ndados=length(dados)
  med=mean(dados)
  id=var(dados)/med
  simula.aleat=rpois(length(dados)*nsim, lambda=med)
  sim.dados=matrix(simula.aleat,ncol= ndados)
  sim.ID=apply(sim.dados,1,ID.curso)
  quant.ID=quantile(sim.ID, probs=c(0.025,0.975))
  if(id>=quant.ID[1] & id<=quant.ID[2])
  { 
    cat("\n\n\n\t distribui��o aleat�ria para alfa=0.05 \n\t ID= ",id,"\n\n\n")
  }
  if(id < quant.ID[1]) 
  { 
    cat("\n\n\n\t distribui��o uniforme, p<0.025 \n\t ID= ",id,"\n\n\n")
  }
  if(id>quant.ID[2])
  { 
    cat("\n\n\n\t distribui��o agregado, p>0.975 \n\t ID= ",id,"\n\n\n")
  }
  resulta=c(id,quant.ID)
  names(resulta)<-c("Indice de Dispers�o", "critico 0.025", "critico 0.975")
  return(resulta)
}
##Testanto os dados simulados
test.ID(aleat) #Testa o indice de distribuicao dos dados simulados.
test.ID(agreg)
test.ID(unif)

##Outra fun��o
###eda.shape

eda.shape <- function(x) #Cria a funcao para o objeto "eda.shape"
{
  x11() 
  par(mfrow = c(2,2))	## muda o dispositivo gr�fico para 2x2
  hist(x)                 ## produz histograma de x
  boxplot(x)
  iqd <- summary(x)[5] -	summary(x)[2]     ## faz a diferen�a entre o quinto elemento x e o segundo
  plot(density(x,width=2*iqd),xlab="x",ylab="",type="l")
  qqnorm(x)
  qqline(x)
  par(mfrow=c(1,1))
  
}

##Criando um vetor de dados com 20 valores simulando a densidade de �rvores por parcelas
set.seed(22) ## estabelece uma semente aleat�ria 
dados.pois20<-rpois(20,lambda=6) ## sorteia dados aleat�rios de uma fun��o poisson com m�dia 6
sum(dados.pois20) ## a somat�ria aqui sempre dar� 131, somente porque a semente � a mesma
set.seed(22)
dados.norm20<-rnorm(20,mean=6, sd=2) ## sorteia 20 dados de uma fun��o normal com m�dia 6 e dp = 1
sum (dados.norm20)               ### aqui o resultado dar� sempre 130.48

###aplicar eda.shape para dados.dens

eda.shape(dados.pois20) #Aplica a fun��o criada para os objetos abaixo. 

eda.shape(dados.norm20)

###aumentando a amostra

eda.shape(rpois(500,6))

eda.shape(rnorm(500,6))


###Modificando uma fun��o
eda.shape1 <- function(x) #Fun��o criada para plotar histogramas e boxplots, definindo a posi��o (2 linhas, duas colunas)
                          #com seus respectivos titulos, nomes do eixo, cor dos simbolos. Calcula normalidade.
{
  x11()
  par(mfrow = c(2,2))
  hist(x,main="Histograma de x")
  boxplot(x, main="BoxPlot de x")
  iqd <- summary(x)[5] -	summary(x)[2]
  plot(density(x,width=2*iqd),xlab="x",ylab="",type="l", main="Distribui��o de densidade de x")
  qqnorm(x,col="red",main="Gr�fico Quantil x Quantil",xlab="Quantil Te�rico",ylab="Quantil da Amostra")
  qqline(x)
  par(mfrow=c(1,1))
  
}

##Executando a fun��o modificada
eda.shape1(rnorm(500,6))

#Fazendos ciclos de operacoes
x1=rpois(20,1) ## sorteia dados aleat�rios de uma fun��o poisson com m�dia 1
x2=rpois(20,2) ## sorteia dados aleat�rios de uma fun��o poisson com m�dia 2
x3=rpois(20,3)## sorteia dados aleat�rios de uma fun��o poisson com m�dia 3
x4=rpois(20,1) ## sorteia dados aleat�rios de uma fun��o poisson com m�dia 1
sp.oc=matrix(c(x1,x2,x3,x4), ncol=4) #Cria uma matris com os dados de x1, x2, x3, x4.
colnames(sp.oc)<-c("plot A", "plot B", "plot C", "plot D") #Nomeia as colunas
rownames(sp.oc)<-paste("sp", c(1:20)) #nomeia as linhas
str(sp.oc) #Mostra um resumo dos dados da matrix
dim(sp.oc) #mostra as dimens�es da matrix
head(sp.oc) #mostra a matrix do objeto "sp.oc"


n.spp<-function(dados) #Cria a fun��o para contar numeros por parcela.
{
  nplot=dim(dados)[2]
  resultados=rep(0,nplot)
  names(resultados)<-paste("n.spp", c(1:nplot))
  dados[dados>0]=1
  for(i in 1:(dim(dados)[2]))
  {
    cont.sp=sum(dados[,i])
    resultados[i]=cont.sp
  }
  return(resultados)
}


##### Aplicando a fun��o 
n.spp(sp.oc)


##Mais fun��o!! SIMILARIDADE
sim<-function(dados)
{
  nplot=dim(dados)[2]
  similar=matrix(1,ncol=nplot,nrow=nplot)
  rownames(similar)<-paste("plot", c(1:nplot))
  colnames(similar)<-paste("plot", c(1:nplot))
  dados[dados>0]=1
  for(i in 1:nplot-1)
  {
    m=i+1
    for(m in m:nplot)
    {
      co.oc=sum(dados[,i]>0 & dados[,m]>0)
      total.sp=sum(dados[,i])+sum(dados[,m])-co.oc
      similar[i,m]=co.oc/total.sp 
      similar[m,i]=co.oc/total.sp 
    }
    
  }
  return(similar)
}

###9.2 Exerc�cio An�lise explorat�ria simult�nea de duas vari�veis


analise.e <- function(x, y)
{
  if(length(x) != length(y)){message ("verificar dados")}
  x11()
  par(mfrow = c(2,2))
      boxplot(x, main = "Variavel x")
      boxplot(y, main = "variavel y")
      iqd <- summary(x)[5] -	summary(x)[2]
      plot(density(x,width=2*iqd),xlab="x",ylab="",type="l", main="Distribui��o de densidade de x")
      qqnorm(x,col="orange",main="Gr�fico Quantil x Quantil",xlab="Quantil Te�rico",ylab="Quantil da Amostra")
      qqline(x)
      par(mfrow=c(1,1))
      return(list(cor(x,y), summary(x,y)))
}
##Testando a fun��o
analise.e(x1,x2)


