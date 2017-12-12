### Aluna:  Maria Aldenise Xavier

riqueza <- c(15,18,22,24,25,30,31,34,37,39,41,45) #Carrega os dados do objeto riqueza
area <- c(2,4.5,6,10,30,34,50,56,60,77.5,80,85)   #Carrega os dados do objeto area
area.cate <- rep(c("pequeno", "grande"), each=6)  #função repetir os nomes pequeno e grande 6 vezes.

plot(riqueza~area) # Plota um gráfico da variável riqueza em função da área.
plot(area,riqueza) # o mesmo que o anterior
boxplot(riqueza~area.cate) #Plota o boxplot da variável riqueza em função da área.
barplot(riqueza) #Plota em forma de barra os valores de riqueza

# Exercício 1, construindo gráficos

#dap e ht
planta = read.table("esaligna.csv", header=T, sep=",", as.is=T)
plot(planta$dap~planta$ht) #Plota no gráfico a variável dap em função de ht.
boxplot(planta$dap~planta$ht) #Plota o boxplot (média e desvio padrão) da variável dap em função de ht.
barplot(planta$dap) #Plota em forma de barra os valores de dap.
barplot(planta$ht) #Plota em forma de barra os valores de ht.

# ht e tronco
plot(planta$ht~planta$tronco) #Plota no gráfico a variável ht em função de tronco.
boxplot(planta$ht~planta$tronco) #Plota o boxplot (média e desvio padrão) da variável ht em função de tronco.
barplot(planta$ht) #Plota em forma de barra os valores de ht.
barplot(planta$tonco) #Plota em forma de barra os valores de tronco.

#dap e classe
plot(planta$dap~planta$classe) #Não executa pois o plot não executa vetor, e classe é uma variável categórica
boxplot(planta$dap~planta$classe) #Plota o boxplot (média e desvio padrão) da variável dap em função de classe.
barplot(planta$dap) #Plota em forma de barra os valores de dap.
barplot(planta$classe) #Classe é uma variável categorica (vetor) e não plota

#dap e talhao
plot(planta$dap~planta$talhao) #Plota no gráfico a variável dap em função de talhão.
boxplot(planta$dap~planta$talhao) #Plota o boxplot (média e desvio padrão) da variável dap em função de talhão .
barplot(planta$dap)  #Plota em forma de barra os valores de dap.
barplot(planta$talhao)  #Plota em forma de barra os valores de talhão.

#dap
plot(planta$dap) #Plota no gráfico a sequencia de valores da variável dap. 
boxplot(planta$dap) #Plota o boxplot (média e desvio padrão) da variável dap.
barplot(planta$dap) #Plota em forma de barra os valores de dap.

#ht
plot(planta$ht) #Plota no gráfico a sequencia de valores da variável ht. 
boxplot(planta$ht) #Plota o boxplot (média e desvio padrão) da variável ht.
barplot(planta$ht) #Plota em forma de barra os valores de ht.

#Editando gráficos
par(las=1) #função "par" para organizar a posição dos eixos. PAra essa função funcionar complementa com "plot(planta$dap~planta$ht"
plot(planta$dap~planta$ht, las=3) #nesse comando organiza a posição dos eixos (1=horizontal, 3=vertical)
par(cex=2) #aumenta o tamanho da fonte da legenda dos eixos.
plot(riqueza~area, cex=2) #aumenta o tamanho dos pontos.

par(mfrow=c(2,1)) #Define a posição dos gráficos, neste caso: duas linhas e uma coluna.
plot(riqueza~area) #plota a variável riqueza em função da área.
boxplot(riqueza~area.cate) #plota a variável riqueza em função da area.cate.

par(mfrow=c(1,2)) #Define a posição dos gráficos, neste caso: uma linha e duas colunas.
plot(riqueza~area) #plota a variável riqueza em função da área.
boxplot(riqueza~area.cate) #plota a variável riqueza em função da área,cate.


par(mfrow=c(2,1)) #Define a posição dos gráficos, neste caso: duas linhas e uma coluna.
par(mar=c(4,14,2,6)) #Define as margens do gráfico.
plot(riqueza~area) #plota a variável riqueza em função da área.
boxplot(riqueza~area.cate) #plota a variável riqueza em função da area.cate.

par(mfrow=c(1,2)) #Define a posição dos gráficos, neste caso: uma linha e duas colunas.
par(mar=c(14,4,8,2)) #Define as margens do gráfico.
plot(riqueza~area) #plota a variável riqueza em função da área.
boxplot(riqueza~area.cate) #plota a variável riqueza em função da area.cate.

par(mfrow=c(1,2)) #Define a posição dos gráficos, neste caso: uma linha e duas colunas.
par(mar=c(8,4,8,1)) #Define as margens do gráfico.
plot(riqueza~area) #plota a variável riqueza em função da área.
par(mar=c(14,2,4,0.5)) #Define as margens do gráfico.
boxplot(riqueza~area.cate) #plota a variável riqueza em função da area.cate.

?plot
riqueza <- c(15,18,22,24,25,30,31,34,37,39,41,45)
area <- c(2,4.5,6,10,30,34,50,56,60,77.5,80,85)
plot(riqueza~area # Plota um gráfico da variável riqueza em função da área.
     , xlab = "Tamanho da Ilha (ha)" #Muda o nome da legenda do eixo x
     , ylab = "Riqueza de Espécies" #Muda o nome da legenda do eixo y
     , main = "Aves das Ilhas Samoa" #Muda o nome da o título do gráfico
     , pch = 6 # muda o tipo de ponto.
     , cex = 2 #muda o tamanho dos pontos
     , par (las=1) #função "par" para organizar a direção da escala do gráfico  (1=horizontal, 3=vertical).
     , plot(riqueza~area)
     , family = "Times New Roman" #O tipo de fonte das legendas 
) 
x11()


### Exercício 3 - Mudando diferentes Gráficos
riqueza <- c(15,18,22,24,25,30,31,34,37,39,41,45) #Objeto variável riqueza
area <- c(2,4.5,6,10,30,34,50,56,60,77.5,80,85) #Objeto variável area
area.cate <- rep(c("pequeno", "grande"), each=6) # Função repetir "pequeno" e "grande" 6 vezes.
plot(riqueza~area) #Plota o gráfico da variável riqueza em função da area.
x11()
plot(riqueza~area, bty="l", tcl =0.3) # bty: define a linha contorno do gráfico; tcl: valor que específica o comprimento dos símbolos de pontuação nos eixos como uma fração da altura das linhas de textos.
boxplot(riqueza~area.cate, bty="l", tcl=0.3) #boxplot é uma caixa com valores de média e desvio padrão e não pode ter contorno em forma de "L"
par(bty="l")
par(tcl=0.3)
boxplot(riqueza~area.cate) #como os parâmetos foram escritos separadamente, foi possível plotar o boxplot.
x11()

#Exercício 4: Inserindo mais informações no gráfico
riqueza <- c(15,18,22,24,25,30,31,34,37,39,41,45) #Objeto variável riqueza
area <- c(2,4.5,6,10,30,34,50,56,60,77.5,80,85) #Objeto variável area
abundancia <- rev(riqueza) #Função que reverte a ordem dos elemento de um determinado objeto.
plot(riqueza~area)
lines(lowess(area, riqueza)) #Insere linhas retas ou curvas não-paramétricas 

model <-  lm(riqueza~area) #Cria o modelo de regressão para depois plotar o gráfico e a linha de regressão.
plot(riqueza~area) #Plota a riqueza em função da área.
abline(model) #Projeta a reta de regressão.

plot(riqueza~area) #Plota a riqueza em função da área.
abline(15,0.4) # 15: intercepto da reta e 0.4: inclinação da reta

plot(riqueza~area) #Plota a riqueza em função da área.
abline(v=mean(area)) #Insere linha vertical
abline(h=mean(riqueza)) #Insere linha horizontal

plot(riqueza~area) #Plota a riqueza em função da área.
text(20,40,"texto") #Insere texto dentro do gráfico, neste caso nas posições x=20 e y=40

plot(riqueza~area) #Plota a riqueza em função da área.
mtext("legenda no lado errado", side=4, line=0.9, at=20,cex=2, family="serif") #Acrescenta o parâmetro "legenda" no gráfico: posição, alinhamento, tamanho da fonte, tipo da fonte.
x11()

plot(riqueza~area) #Plota a riqueza em função da área.
par(new=TRUE) #Sobreponhe um novo gráfico a um gráfico já existente)
plot(abundancia~area) #Plota a abundancia em função da área.

plot(riqueza~area) #Plota a riqueza em função da área.
par(new=TRUE) #Sobreponhe um novo gráfico a um gráfico já existente)
plot(abundancia~area, axes=FALSE, ann=FALSE, pch=16) # Axes=False suprime a criação dos eixos do gráfico inicial de abundância e ann=False suprime a legenda de abundância do lado direito. pch=16: Diferencia os pontos entre os dois plots.
axis(4) #projeta os valores do eixo 4

jpeg(filename = "Algumnome.jpg") #Salva o grafico em formato jpg.
plot(riqueza~area) #Plota a riqueza em função da área.
rect(20,20,40,40) #Insere retangulo englobando o intervalo de 20 a 40 no eixo x, e de 20 a 40 no eixo y.
dev.off() #reseta 

jpeg(filename = "Rplotaula.jpg", width = 480, height = 480, 
     units = "px", pointsize = 12, quality = 100,
     bg = "white",  res = NA, restoreConsole = TRUE)

par(mfrow=c(1,2))
par(mar=c(14,4,8,2))
plot(riqueza~area)
boxplot(riqueza~area.cate)
x11()
dev.off()

png("meugrafico%02d.png") #Salva o gráfico em formato png.
bmp(filename = "Rplot%03d.bmp") #Salva o gráfico em formato bmp.
jpeg(filename = "Rplot%03d.jpg") #Salva o gráfico em formato jpeg.
png(filename = "Rplot%03d.png") #Salva o gráfico em formato png.
tiff(filename = "Rplot%03d.bmp") #Salva o gráfico em formato tiff.


#####################Exercício 5, criação de gráficos#######################

planta = read.table("esaligna.csv", header=T, sep=",", as.is=T)
par(cex=2) #muda o tamanho da fonte
plot(planta$dap~planta$ht
     , xlab = "Altura (m)" #Muda o nome da legenda do eixo x
     , ylab = "DAP (cm)" #Muda o nome da legenda do eixo y
     , main = "Relação entre DAP e Altura de Eucalyptus Saligna" #Muda o nome da o título do gráfico
     , bty = "l" #Apenas dois eixos (formato "L")
     , tcl= 0.3 #Marcações do eixos (ticks) para dentro da área do gráfico
     
) 

par(mfrow=c(1,2))
boxplot(planta$dap~Biomassa$talhao)
text(1,20, "a")
x11()
m1= mean(planta$dap[planta$talhao== "16"]);
m2= mean(planta$dap[planta$talhao== "17"]);
m3= mean(planta$dap[planta$talhao== "18"]);
m4= mean(planta$dap[planta$talhao== "22"]);
m5= mean(planta$dap[planta$talhao== "23"]);
m6= mean(planta$dap[planta$talhao== "32"]);
s1= sd(planta$dap[planta$talhao== "16"])
s2= sd(planta$dap[planta$talhao== "17"])
s3= sd(planta$dap[planta$talhao== "18"])
s4= sd(planta$dap[planta$talhao== "22"])
s5= sd(planta$dap[planta$talhao== "23"])
s6= sd(planta$dap[planta$talhao== "32"])
avg= c(m1,m2,m3,m4,m5,m6)
sdev= c(s1,s2,s3,s4,s5,s6)
plot(x= 1:6, y=  avg, cex= 1.5, pch= 16, col= 1:6, ylim = range(c(dapm - sdev, avg + sdev)))
arrows(x0= 1:6, y0= avg - sdev, x1= 1:6, y1= avg + sdev, length = 0.05, angle = 90, code = 3)
text(1,2, "b")

#Não consegui fazer
grafico = read.table("exercicio3.csv", header=T, sep=",", as.is=T)
plot(grafico$y ~ grafico$x1)
par(new=TRUE)
plot(grafico$y2-grafico$y1 ~ grafico$x2-x1, axes= FALSE, ann=FALSE, pch=17) 
axis(side=2, tck = 0.02, at = seq(from = 0.5, to = 3.5, by = 0.5))
axis(side=1, tck = 0.02, at = seq(from = 0.5, to = 2.5, by = 0.5))
x11()
