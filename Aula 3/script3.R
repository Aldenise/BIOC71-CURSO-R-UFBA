######################################################
# Introdução Linguagem R                          ####
# Vitor Passos Rios                               ####
# Universidade Federal da Bahia                   ####
# https://github.com/vrios/Intro-Linguagem-R/wiki#####
######################################################

#diferencie a função source da função load()
### Source: Executa os comandos dentro do arquivo. E load: Carrega um conteúdo do arquivo para dentro de um objeto.

#baixe para seu diretório de trabalho o arquivo toroidal.distance.R, disponível
#em https://raw.githubusercontent.com/vrios/Intro-Linguagem-R/master/arquivos/toroidal.distance.R, e o arquivo distancias.csv, disponivel em https://raw.githubusercontent.com/vrios/Intro-Linguagem-R/master/arquivos/distancias.csv

source("https://raw.githubusercontent.com/vrios/Intro-Linguagem-R/master/arquivos/toroidal.distance.R")
distancia = read.csv("https://raw.githubusercontent.com/vrios/Intro-Linguagem-R/master/arquivos/distancias.csv")
download.file("https://raw.githubusercontent.com/vrios/Intro-Linguagem-R/master/arquivos/toroidal.distance.R", destfile = "toroidal.distance.R")
file.edit("toroidal.distance.R")

#Abra toroidal.distance.R no R
# O que você precisa fazer para que as funções contidas nesse arquivo estejam disponíveis para uso no R?
### Usar a função Source.

# Faça o procedimento que você descreveu acima


# Dentro do script toroidal.distance.R, altere o nome da função toroidal.distances para distance.matrix (substitua o nome dentro do arquivo) e salve o arquivo

# Carregue o arquivo para dentro do objeto distancias
#chame a função distance.matrix() com o objeto distancias, e o argumento tam = 100

distance.matrix(distancia, tam = 100)


# O que aconteceu?
### Abriu a matriz

# O que você precisa fazer para que você possa usar a função distance.matrix?
### EXecutar a função
objeto = distance.matrix(distancia, tam = 100)
write.csv(objeto, file = "distance.matrix.csv")

# Salve o resultado do comando acima com o nome de matriz.distancias.csv

# Usando a linha de comando, importe o arquivo dragoes.xsls para o objeto DnD
#https://raw.githubusercontent.com/vrios/Intro-Linguagem-R/master/arquivos/dragoes.xlsx (não abra o excel nem salve em .csv)

getwd()
download.file("https://raw.githubusercontent.com/vrios/Intro-Linguagem-R/master/arquivos/dragoes.xlsx", destfile = "dragoes.xlsx")
library(readxl)
DnD = read_xlsx("dragoes.xlsx")
read_xlsx("dragoes.xlsx")


# Confira a estrutura do arquivo

# Há algum NA? houve algum problema com o cabeçalho?
###Houve NA. ###Sim, no cabeçalho tem palavras com acentos, espaçamento, letras maiúsculas.

# Refaça o script da aula 2, salvando o objeto caixeta, adicionando a coluna coletor e desvio, em um arquivo chamado caixeta_com_desvio.csv
caixeta = read.table("caixeta.csv", header=T, sep=",", as.is=T)
caixeta$coletor = "Darwin"
caixeta$desvio = caixeta$h - mean(caixeta$h)
caixeta
write.table(caixeta, "caixeta_com_desvio.csv")

