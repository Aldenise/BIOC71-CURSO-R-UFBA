######################################################
# Introdução Linguagem R
# Vitor Passos Rios
# Universidade Federal da Bahia
# https://github.com/vrios/Intro-Linguagem-R/wiki
#####################################################

#####Usando o R como calculadora#####

#Digite no R os códigos abaixo.
#Dica: escreva neste arquivo, ao lado do comando, o que ele faz,
#como no exemplo abaixo

1 + 1 #soma os valores

# O símbolo # representa um comentário, isto é, tudo que vier à direita
# dele será ignorado quando o R ler o arquivo

34 - 72,3 #Subtração dos valores

# use pontos como separador de decimal. O que acontece se você usar virgula?
##não resolve pois ele não lê a vírgula como decimal, já que o programa é em inglês

78 / 3 #Divisão dos valores
2 ^ 3 #Potência de 3
3 * 2 #multiplicação dos valores
sqrt(2) #Raís quadrada de 2
pi #valor de pi
log(x = 3,base = 10) #log de 3 na base 10
exp(x = 1) #exponencial de 1

#o que querem dizer estes valores dentro do parêntese? porque usamos o = aqui?
## Os parenteses significam função e o = operador de atribuições



#####Atribuição de valores e criação de objetos#####
#O que os comandos abaixo fazem?
objeto1=3 #cria um objeto1 referente ao valor 3
objeto1 #Resgata o valor do objeto1
objeto = 42 #Cria um objeto com valor 42
objeto #resgata o valor do objeto
objeto.2 <- 42 #Cria o objeto.2 com valor 42
objeto.2 #Resgata o valor do objeto.2
# Os símbolos = e <- fazem basicamente a mesma coisa. Que coisa?
objeto.cubico <- objeto^3 #Calcula o valor do objeto 42 na potência 3
resultado.1 <- (objeto.cubico / 3) + 7 #Calcula o valor do Objeto.cubico (74088) dividido por 3 + 7)
objeto.texto <- "texto sempre vem entre aspas" # mostra que os vetores do objeto são textos
objeto.texto #Resgata o vetor texto do objeto
objeto.texto.2 <- "42" #Nesse caso, o vetor não pode estar entre aspas pois é numero, e o R está lendo como texto.

objeto.vetor.1 = 1:34 #Sequencia de 1 a 34
objeto.vetor.1 #Mostra a sequencia de 1 a 34
objeto.vetor2 = c(1, 74.5, 48) #Criação de um vetor
objeto.vetor2 #mostra o vetor mostrado

?seq #Help da função sequência)
objeto.vetor3 = seq(from = 20, to = 32, by = 0.5) #Sequencia de valores inciando no 20 e finalizando em 32, a cada 0.5

#podemos calcular estatísticas com o r
mean(objeto.vetor3) #media do objeto.vetor3
var(objeto.vetor3) #variancia do objeto
median(objeto.vetor3) #mediana da sequencia
min(objeto.vetor3) #O mínimo valor da sequência
max(objeto.vetor3) #O máximo valor da sequência 
diff(objeto.vetor3) #calcula a diferença entre os elementos sucessivos do vetor

# R também faz comparações entre objetos
42 > 7 #True
objeto == objeto.2 #Comparam os objetos e tem os mesmos valores
objeto == objeto.texto.2 #Comparam os objetos e tem os mesmos valores
# o que aconteceu acima?
7.1 <= 7.001 #É False pois 7.1 é maior igual a 7.001
?"<" #Abre a função Help dessa operação

#pedindo ajuda
?pi #Abre o Help da função pi.
?log #Abre o Help da função log.
??lm #Pesquisa no R todos as funções que usa lm
help(log) #Abre o Help do log
help.search("anova") #Pesquisa no R todos as funções que usa anova

#####Arquivos e diretórios#####
# Como você descobre o diretório de trabalho?
###Digita getwd() no console

# Como você lista o conteúdo do diretório de trabalho?
###Na Área de trabalho (Desktop) leve o cursor do mouse até o canto superior
###direito da tela e vai descendo que irá aparecer a barra lateral e iremos clicar no primeiro
###ícone que aparece que é a lupa que se refere a procurar (search) como é mostrado nas telas 
###abaixo.  Digitando cmd no campo de procura, irá aparecer a opção prompt de comando e então 
###clicamos nesta opção. O comando dir, irá listar o que há dentro do diretório. Exemplo: c:\dir 

# Como você define o diretório de trabalho?
###Barra de menu, clica em Tools, "Global options", "Browse" e Seleciona o diretório.

# Como você carrega um arquivo de script?
###Na barra de ferramentas, clique em "Open"... ou, no menu "File", clique em "Open". Na caixa
###de diálogo "Open", selecione o arquivo que você deseja abrir. O arquivo aberto aparece em uma nova guia.

# Como você salva os objetos que criou?
### Em "File" clique em "Save as" e salve-o na pasta desejada (diretório). Ou na barra de ferramentas 
###clique no "símbolo do Disquete" e salve-o no diretório desejado.

# Como você carrega os objetos que criou?
### "Ctrl + enter" ou "Run" na barra de atalhos.

# Como ver quais objetos estão na sua área de trabalho?
###São visualizados em "Environment".

# Como remover objetos da área de trabalho?
###O comando remove e rm apagam objetos da área de trabalho.

##### Lidando com erros#####
# O que acontece quando você digita os comandos abaixo? Como consertar cada erro?

objetol
###Error: object 'objetol' not found
###Solução: Corrigir o nome do objeto para aquele que foi criado.

objeto .texto
###Error: unexpected symbol in "objeto .texto"
###Solução: Tirar o espaço entre o objeto e o ponto.

Objeto
###Error: object 'Objeto' not found
###Solução: O nome do objeto foi escrito em letras minúsculas, e o comando
###o objeto com inicial maiúscula.

source("chuchu.R")
###cannot open the connection
###In addition: Warning message:
###In file(filename, "r", encoding = encoding) :
###cannot open file 'chuchu.R': No such file or directory
###Solução: Este tipo de erro indica que o arquivo "chuchu.R" não existe no diretório.

source(chuchu.R)
###Error in source(chuchu.R) : object 'chuchu.R' not found
###Solução: Mesmo que o arquivo exista ele não vai encontrar porque foi escrito sem aspas.

setwd("C:/CavernaDoDragão")
###Error in setwd("C:/CavernaDoDragão") : cannot change working directory
###Solução: Esse comando é para mudar o nome do diretório. Mas, enquanto o arquivo estiver 
###sendo usado ele não pode ser alterado.

getwd
###function () 
###.Internal(getwd())
###<bytecode: 0x0000000008d4eed8>
###<environment: namespace:base>
###Solução: Mostra que no comando solicitado falta colocar os parênteses.

Getwd()
###Error: could not find function "Getwd"
###Solução: Essa comando tem que ser escrito com a inicial minúscula.
