#####Trabalhando com dados#####
# o que é um dataframe? Qual a diferneça entre um dataframe e um list?
### É uma matriz que pode conter números, caracteres e vetores. Lista os
###objetos que estão contidos em um dataframe ou mais dataframe.

# o que as funções abaixo fazem? O que elas retornam?
is.vector() #testa o tipo de objeto se é do tipo vetor.
is.numeric() #testa se o objeto é do tipo númérico.
is.character() #testa se o objeto é do tipo categórico (texto).
is.matrix(peso) #testa se o objeto peso é do tipo matrix.
is.na() #indica os NA em seus dados. Mostrando False quando não é NA e True quando é NA.
is.data.frame() #testa se a variável é do tipo data.frame.


#o que queremos dizer quando dizemos uma função "retorna" alguma coisa?
###É o valor final que o R te dá quando executa afunção que você mandou executar.

#o que a função summary() faz?
###Faz um resumo estatístico de seus dados, como máximo, mínimo, média, inclinação da reta, etc.


#Três áreas foram submetidas aplicação de três adubos diferentes, e uma foi
#mantida como controle. A biomassa seca (kg) por parcela foi medida para
#verificar se houve efeito do adubo. Os dados obtidos foram:

#(Controle)	A	37	34	36	42	31  33
#B	62	54	57	64	60
#C	63	58	60	62	61 44
#D	41	37	38	49	35 49
#Crie um dataframe com estes dados
tratamento=c(rep("a",6), rep("b",5), rep("c",6), rep("d",6))
pesos= c(37,	34,	36,	42,	31,  33, 62,	54,	57,	64,	60, 63,	58,	60,	62,	61, 44, 41,	37,	38,	49,	35, 49)
adubados = data.frame(tratamento, pesos) 
View(adubados)

#Calcule a média de cada tipo de adubo, sem usar summary(), usando o dataframe
#que você criou acima
media.a=mean(adubados$pesos[adubados$tratamento == "a"]) #calcula
media.b=mean(adubados$pesos[adubados$tratamento == "b"])
media.c=mean(adubados$pesos[adubados$tratamento == "c"])
media.d=mean(adubados$pesos[adubados$tratamento == "d"])


#que problemas você teve ao fazer o exercício acima?
###Tinha objeto a menos no controle a.


# O que a função unique() faz?
###Retorna um objeto similar, ignorando os nomes duplicados###


#Usando o conjunto de dados caixeta.csv, disponivel em
#http://ecologia.ib.usp.br/bie5782/doku.php?id=dados:dados-caixeta, calcule
#quantas espécies estão presentes na coluna especie. Para ler o arquivo, execute
#o código abaixo

caixeta = read.table("caixeta.csv", header=T, sep=",", as.is=T)
summary(caixeta$especie)
species = (caixeta$especie)
unique(species)

# o arquivo deve estar no seu diretório de trabalho
str(caixeta) #o que este comando faz?
###Mostra como os dados estão organizados no objeto.
summary(caixeta)
unique()

#podemos criar uma coluna a mais no nosso dataframe apenas dizendo ao R o que
#colocar lá. Por exemplo, criamos uma coluna com o nome do coletor do dado
caixeta$coletor= "Darwin" #regra da reciclagem
str(caixeta)

#agora adicione no objeto caixeta uma coluna chamada "desvio" com o quanto a
#altura de cada árvore difere da média de todas as árvores
mediadasarvores = mean(caixeta$h) 
caixeta$desvio = (caixeta$h-mediadasarvores) # ou caixeta$desvio = caixeta$h - mean(caixeta$h)
str(caixeta)
caixeta$desvio
head(caixeta)
  
#Usando a fun$ão table(), conte quantos indivíduos de cada espécie existem
table(caixeta$especie)

#A função table() também pode contar por espécie em cada local, depois por local
#em cada espécie). Como?
table(caixeta$especie, caixeta$local) #a virgula significa "ordenado por".
table(caixeta$local, caixeta$especie)

#crie um objeto chamado pequenas que contenha todas as árvores com altura (h)
#menor que um metro.(Os dados no arquivo estão em centímetros)
pequenas = caixeta[caixeta$h < 100,]

#crie um objeto chamado grandes que contenha todas as árvores acima de 3 metros
grandes = caixeta[caixeta$h > 300,]

#crie um objeto chamado medias que todas as árvores com alturas entre um metro e tres metros
medias = caixeta[caixeta$h >= 100 & caixeta$h <= 300,]

#agora em uma linha de comando, crie um objeto que contenha a quantidade de árvores pequenas, médias e grandes, separadamente
todas = c(length(pequenas$local), length(medias$local), length(grandes$local))

#Crie um objeto chamado obj somente com os individuos de "Alchornea
#triplinervia" Em quantas localidades esta espécie ocorre? Qual comando para
#encontrar essa informação?
obj = caixeta[caixeta$especie == "Alchornea triplinervia",]
obj
table(obj$local) #contando o numero de espécie por localidade

#podemos remover dados de um dataframe, usando o sinal de menos

caixeta.sem.tabebuia = caixeta[ - which(caixeta$especie=="Tabebuia cassinoides"),] 
sort(
  unique(caixeta.sem.tabebuia$especie)
  )

#agora crie um objeto removendo todas as "Tabebuia cassinoides" do local retiro
#(somente do local retiro)
caixeta.sem.retiro = caixeta[!c(caixeta$local == "retiro" & caixeta$especie == "Tabebuia cassinoides"),] # ! não ser retiro e nem tabebuia


#crie os objetos abaixo, junte eles num dataframe de duas colunas chamado comNA,
#depois crie um novo objeto chamado semNA, removendo todas as linhas que
#contenham NA, usando a notação acima (dica: só se usa "" para valores do tipo
#character)
id = 1:80
a = c(121.72355, 103.79754, 130.15442, 98.29305, 103.43365, 102.44998,
      NA, 111.07215, 113.74047, 103.16081, 80.87149, 98.66692,
      65.09549, 155.74965, 88.30168, 147.43610, 114.60806, 109.87433,
      149.54772, 83.54137)
b = c(77.91352, 78.07251, 81.95604, 75.64862, 78.45213, 79.11058,
      79.98952, 79.18127, 840.1635, 74.86860, 82.01886, 78.26936,
      77.94691, 78.75372, 77.64901, NA, 77.19803, 72.48175,
      83.45336, 78.99681)
c = c(127.9366, 201.7158, NA, 136.5880, 131.7213, 118.1486,
      125.7534, 139.6544, 163.5890, 139.7455, NA, 141.4450, 110.7311,
      157.5921, 176.8437, 102.8659, 121.8286, 134.7097, 157.1392, 166.7133)
d = c(191.3721, 216.1671, 165.4380, 196.2730, 172.6565, 178.2955,
      193.6687, NA, 160.2968, 208.4400, 204.0934, 208.1798,
      186.6380, 193.9446, NA, 198.6853, 213.8838, 210.1881,
      209.9109, 210.9228)
comNA=data.frame(id,c(a,b,c,d))
View(comNA)

semNA = comNA[!is.na(comNA$c.a..b..c..d.),]
semNA = na.omit(comNA) #essa função roda a mesma função de cima.


#Abaixo temos dados de tamanho de mandíbula de chacal dourado. Crie um dataframe com esses dados. Qual a média por sexo? E para a espécie? Guarde estes valores em tres objetos diferentes. Quantos machos tem a mandíbula maior do que a média das fêmeas?
#Abaixo temos dados de tamanho de mandíbula de chacal dourado. Crie um dataframe com esses dados. Qual a média por sexo? E para a espécie? Guarde estes valores em tres objetos diferentes.
#machos: 120 107 110 116 114 111 113 117 114 112
#femeas: 110 111 107 108 110 105 107 106 111 111
#Quantos machos têm a mandíbula maior do que a média das fêmeas?


machos = c(120, 107, 110, 116, 114, 111, 113, 117, 114, 112)
femeas = c(110, 111, 107, 108, 110, 105, 107, 106, 111, 111)
media.m = mean(machos)
media.f = mean(femeas)
media.sp = mean(c(machos, femeas))
machos.grandes = machos [machos > media.f] #usando  os objetos separados
machos.grandes
#ou fazendo um data.frame
chacais = data.frame (machos, femeas)
media.m1 = mean(chacais$machos)
media.f1 = mean(chacais$femeas)

machos.grandes1 = chacais$machos[chacais$machos > media.f1]

#escreva **uma** linha de código que testa se um número é par, e caso seja,
#manda uma mensagem dizendo "par". dica: use a função %% (resto da divisão, ou
#remainder em inglês) e a função message()
if(8 %% 2 == 0){message ("par")} #se o resto da divisão de 8 por 2 for 0 (resto), me informe par

#agora crie um código  como acima, mas que diga "par" se for par e "impar" se
#for impar. Dica: leia sobre as funções else e if else
if (8 %% 2 == 0) {message[par]} else {message ("impar")} # se o resto da divisão de 8 por 2 for 0 digite par, senão (else) digite impar.

#exemplo do dragao

vacas = c(121.72355, 103.79754, 130.15442, 98.29305, 103.43365, 102.44998, 125.49993,
          111.07215, 113.74047, 103.16081, 80.87149, 98.66692, 65.09549, 155.74965,
          88.30168, 147.4361, 114.60806, 109.87433, 149.54772, 83.54137)
fazendeiros = c(77.91352, 78.07251, 81.95604, 75.64862, 78.45213, 79.11058,
                79.98952, 79.18127, 840.1635, 74.8686, 82.01886, 78.26936, 77.94691, 78.75372,
                77.64901, 77.64097, 77.19803, 72.48175, 83.45336, 78.99681)
virgens = c(127.9366, 201.7158, 136.1366, 136.588, 131.7213, 118.1486, 125.7534,
            139.6544, 163.589, 139.7455, NA, 141.445, 110.7311, 157.5921, 176.8437,
            102.8659, 121.8286, 134.7097, 157.1392, 166.7133)
aventureiros = c(191.3721, 216.1671, 165.438, 196.273, 172.6565, 178.2955, 193.6687,
                 189.7674, 160.2968, 208.44, 204.0934, 208.1798, 186.638, 193.9446, 197.365,
                 198.6853, 213.8838, 210.1881, 209.9109, 210.9228)

alimento = c(rep("vacas", 20), rep("fazendeiros", 20), rep("virgens", 20), rep("aventureiros",
                                                                               20))
dragoes = data.frame(x = alimento, y = c(vacas, fazendeiros, virgens, aventureiros))
head(dragoes)

dragoes$x=factor(dragoes$x) # se x não for fator ele converte aqui (não precisou dessa função nesse arquivo).

teste.de.normalidade = shapiro.test(dragoes$y)
if (teste.de.normalidade$p.value >= 0.05){
  fit = lm(dragoes$y - dragoes$x)
  summary(fit)
  plot(dragoes, main="normal")
} else {
    kruskal.test(dragoes)
  plot(dragoes, main= "kruskal")
}
  

#crie um ciclo (for) que mostre o console todos os inteiros de 1 até 10, um por um
for (i in 1:10){ #o for serve para fazer funções repetitivas. nesse caso ele diz que i (indice ou contador)é uma sequencia de 1 ate dez, e depois peço para efetuar uma função. in significa dentro da sequencia
  a = i^2
  message(a)

for (i in 1:10){
  a = i
message(a)
}

for (i in 10:1) { #coloque aqui uma sequencia com quantas vezes vc quer  repetir seu código
  message(Sys.time()) #insira seu código repetitivo aqui
}

#crie um ciclo (for) que some todos os inteiros de 25 até 43, guardando esses
#valores num objeto soma (dica: crie o objeto soma com valor zero antes do
#código do ciclo)
soma=0
for (i in 25:43){
  soma = soma +i
message(soma)
}
#####Desafio level Hard#####
#Escreva um código que escreva os números de um a 100, com as seguintes
#condições: Se o número for multiplo de 3, ao invés do dígito, escreva "Fu". Se
#o número for múltiplo de 5, ao invés do dígito, escreva "bá". Para números que
#forem multiplos tanto de 3 quanto de 5, escreva "Fubá". A melhor solução ganha
#um chocolate
for (i in 1:100) {
  if (i %% 3 == 0) {message("Fu")}
  if (i %% 5 == 0) {message("bá")}
  if (i %% 3 & i %% 5 == 0) {message("Fubá")}
}

for (i in 1:100) {
  if (i %% 3 == 0) {message("Fu")}
  if (i %% 5 == 0) {message("bá")}
  if (i %% 3 & i %% 5 == 0) {message("Fubá")}
  if (i %% 3 & i %% 5 != 0) {print(i)}
}

sequencia = for (i in 1:100) {
  if (i %% 3 == 0) {message("Fu")}
  if (i %% 5 == 0) {message("bá")}
  if (i %% 3 & i %% 5 == 0) {message("Fubá")}
} else {
  (print(i))
}
for (i in 1:100) {
  if (i %% 3 == 0) {message("Fu")}
  if (i %% 5 == 0) {message("bá")}
  if (i %% 3 == 0 & i %% 5 == 0) {message("Fubá")}
} else {(sequencia, message(i))
}




} else {
  kruskal.test(dragoes)
  plot(dragoes, main= "kruskal")
}