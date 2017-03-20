
user.word <- readline("what word do you want find?? \n")
user.num <- readline("how many word do you want analyze?\nyour input is number of following word and number of followed word\n")

#my.file <- make.file.word.v.l("melville.txt",getwd())

my.word.position <- find.word(my.file,user.word)

my.kwic<-kwic(my.file,my.word.position,user.num)
