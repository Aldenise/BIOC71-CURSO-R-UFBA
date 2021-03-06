######################################################
# Introdu��o Linguagem R
# Vitor Passos Rios
# Universidade Federal da Bahia
# https://github.com/vrios/Intro-Linguagem-R/wiki
#####################################################

#####Usando o R como calculadora#####

#Digite no R os c�digos abaixo.
#Dica: escreva neste arquivo, ao lado do comando, o que ele faz,
#como no exemplo abaixo

1 + 1 #soma os valores

# O s�mbolo # representa um coment�rio, isto �, tudo que vier � direita
# dele ser� ignorado quando o R ler o arquivo

34 - 72,3 #Subtra��o dos valores

# use pontos como separador de decimal. O que acontece se voc� usar virgula?
##n�o resolve pois ele n�o l� a v�rgula como decimal, j� que o programa � em ingl�s

78 / 3 #Divis�o dos valores
2 ^ 3 #Pot�ncia de 3
3 * 2 #multiplica��o dos valores
sqrt(2) #Ra�s quadrada de 2
pi #valor de pi
log(x = 3,base = 10) #log de 3 na base 10
exp(x = 1) #exponencial de 1

#o que querem dizer estes valores dentro do par�ntese? porque usamos o = aqui?
## Os parenteses significam fun��o e o = operador de atribui��es



#####Atribui��o de valores e cria��o de objetos#####
#O que os comandos abaixo fazem?
objeto1=3 #cria um objeto1 referente ao valor 3
objeto1 #Resgata o valor do objeto1
objeto = 42 #Cria um objeto com valor 42
objeto #resgata o valor do objeto
objeto.2 <- 42 #Cria o objeto.2 com valor 42
objeto.2 #Resgata o valor do objeto.2
# Os s�mbolos = e <- fazem basicamente a mesma coisa. Que coisa?
objeto.cubico <- objeto^3 #Calcula o valor do objeto 42 na pot�ncia 3
resultado.1 <- (objeto.cubico / 3) + 7 #Calcula o valor do Objeto.cubico (74088) dividido por 3 + 7)
objeto.texto <- "texto sempre vem entre aspas" # mostra que os vetores do objeto s�o textos
objeto.texto #Resgata o vetor texto do objeto
objeto.texto.2 <- "42" #Nesse caso, o vetor n�o pode estar entre aspas pois � numero, e o R est� lendo como texto.

objeto.vetor.1 = 1:34 #Sequencia de 1 a 34
objeto.vetor.1 #Mostra a sequencia de 1 a 34
objeto.vetor2 = c(1, 74.5, 48) #Cria��o de um vetor
objeto.vetor2 #mostra o vetor mostrado

?seq #Help da fun��o sequ�ncia)
objeto.vetor3 = seq(from = 20, to = 32, by = 0.5) #Sequencia de valores inciando no 20 e finalizando em 32, a cada 0.5

#podemos calcular estat�sticas com o r
mean(objeto.vetor3) #media do objeto.vetor3
var(objeto.vetor3) #variancia do objeto
median(objeto.vetor3) #mediana da sequencia
min(objeto.vetor3) #O m�nimo valor da sequ�ncia
max(objeto.vetor3) #O m�ximo valor da sequ�ncia 
diff(objeto.vetor3) #calcula a diferen�a entre os elementos sucessivos do vetor

# R tamb�m faz compara��es entre objetos
42 > 7 #True
objeto == objeto.2 #Comparam os objetos e tem os mesmos valores
objeto == objeto.texto.2 #Comparam os objetos e tem os mesmos valores
# o que aconteceu acima?
7.1 <= 7.001 #� False pois 7.1 � maior igual a 7.001
?"<" #Abre a fun��o Help dessa opera��o

#pedindo ajuda
?pi #Abre o Help da fun��o pi.
?log #Abre o Help da fun��o log.
??lm #Pesquisa no R todos as fun��es que usa lm
help(log) #Abre o Help do log
help.search("anova") #Pesquisa no R todos as fun��es que usa anova

#####Arquivos e diret�rios#####
# Como voc� descobre o diret�rio de trabalho?
###Digita getwd() no console

# Como voc� lista o conte�do do diret�rio de trabalho?
###Na �rea de trabalho (Desktop) leve o cursor do mouse at� o canto superior
###direito da tela e vai descendo que ir� aparecer a barra lateral e iremos clicar no primeiro
###�cone que aparece que � a lupa que se refere a procurar (search) como � mostrado nas telas 
###abaixo.  Digitando cmd no campo de procura, ir� aparecer a op��o prompt de comando e ent�o 
###clicamos nesta op��o. O comando dir, ir� listar o que h� dentro do diret�rio. Exemplo: c:\dir 

# Como voc� define o diret�rio de trabalho?
###Barra de menu, clica em Tools, "Global options", "Browse" e Seleciona o diret�rio.

# Como voc� carrega um arquivo de script?
###Na barra de ferramentas, clique em "Open"... ou, no menu "File", clique em "Open". Na caixa
###de di�logo "Open", selecione o arquivo que voc� deseja abrir. O arquivo aberto aparece em uma nova guia.

# Como voc� salva os objetos que criou?
### Em "File" clique em "Save as" e salve-o na pasta desejada (diret�rio). Ou na barra de ferramentas 
###clique no "s�mbolo do Disquete" e salve-o no diret�rio desejado.

# Como voc� carrega os objetos que criou?
### "Ctrl + enter" ou "Run" na barra de atalhos.

# Como ver quais objetos est�o na sua �rea de trabalho?
###S�o visualizados em "Environment".

# Como remover objetos da �rea de trabalho?
###O comando remove e rm apagam objetos da �rea de trabalho.

##### Lidando com erros#####
# O que acontece quando voc� digita os comandos abaixo? Como consertar cada erro?

objetol
###Error: object 'objetol' not found
###Solu��o: Corrigir o nome do objeto para aquele que foi criado.

objeto .texto
###Error: unexpected symbol in "objeto .texto"
###Solu��o: Tirar o espa�o entre o objeto e o ponto.

Objeto
###Error: object 'Objeto' not found
###Solu��o: O nome do objeto foi escrito em letras min�sculas, e o comando
###o objeto com inicial mai�scula.

source("chuchu.R")
###cannot open the connection
###In addition: Warning message:
###In file(filename, "r", encoding = encoding) :
###cannot open file 'chuchu.R': No such file or directory
###Solu��o: Este tipo de erro indica que o arquivo "chuchu.R" n�o existe no diret�rio.

source(chuchu.R)
###Error in source(chuchu.R) : object 'chuchu.R' not found
###Solu��o: Mesmo que o arquivo exista ele n�o vai encontrar porque foi escrito sem aspas.

setwd("C:/CavernaDoDrag�o")
###Error in setwd("C:/CavernaDoDrag�o") : cannot change working directory
###Solu��o: Esse comando � para mudar o nome do diret�rio. Mas, enquanto o arquivo estiver 
###sendo usado ele n�o pode ser alterado.

getwd
###function () 
###.Internal(getwd())
###<bytecode: 0x0000000008d4eed8>
###<environment: namespace:base>
###Solu��o: Mostra que no comando solicitado falta colocar os par�nteses.

Getwd()
###Error: could not find function "Getwd"
###Solu��o: Essa comando tem que ser escrito com a inicial min�scula.
