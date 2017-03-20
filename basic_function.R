analysis.start <- function(){
  text.v <- scan("melville.txt",what="character",sep="\n")
  start.v <- which(text.v == "CHAPTER 1. Loomings.")
  end.v <- which(text.v == "orphan.")
  novel.lines.v <- text.v[start.v:end.v]
  chap.position.v <- grep("^CHAPTER \\d",novel.lines.v)
  novel.lines.v[chap.position.v]
  novel.lines.v<-c(novel.lines.v,"END")
  last.position.v<-length(novel.lines.v)
  chap.position.v<-c(chap.position.v,last.position.v)
  
}

make.file.word.v.l <- function(files.v,input.dir){
  text.word.vector.l<- list()
  for ( i in 1:length(files.v)){
    text.v <- scan(paste(input.dir,files.v[i],sep="/"),
                   what="character",sep="\n")
    text.v <- paste(text.v,collapse = " ")
    text.lower.v <- tolower(text.v)
    text.words.v <- strsplit(text.lower.v,"\\W")
    text.words.v <- unlist(text.words.v)
    text.words.v <- text.words.v[which(text.words.v!="")]
    text.word.vector.l[[files.v[i]]] <- text.words.v
  }
  return(text.word.vector.l)
}

find.word <- function(file.l,word){
  find.word.position <- which(file.l[[1]][]==word)
  return(find.word.position)
}

kwic <- function(file,position,num){
  temp.kwic.v <- vector()
  temp.range <- (-1*as.numeric(num)):as.numeric(num)
  for(i in 1:length(position)){
    for(j in temp.range){
      temp.kwic.v<-c(temp.kwic.v,file[[1]][(position[i]+j)])
    }
  }
  return(temp.kwic.v)
}