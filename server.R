library(shiny)
library(wordcloud)
library(RColorBrewer)
colors <- brewer.pal(9,"Set1")
source('basic_function.R')
my.file <- make.file.word.v.l("melville.txt",getwd())

shinyServer(function(input, output) {

  compute <- reactive({ # 이전에 텍스트 마이닝 관련하여 공부하던 예제를 가져왔습니다.
    
    input$goButton
    validate(need(isolate(input$word),"값을 입력해주세요."))
    my.word.position <- find.word(my.file,isolate(input$word))
    my.kwic<-kwic(my.file,my.word.position,isolate(input$num))
    arg2<-table(my.kwic)
    arg1<-names(arg2)
    validate(need(arg1,"검색하신 단어가 없습니다."))
    
    return(arg2)
   })

  output$plot <- renderPlot({
    
    arg<-compute()
    wordcloud(names(arg),arg,scale=c(isolate(input$scale[2]),isolate(input$scale[1])),min=isolate(input$min_num)
                           ,random.order=isolate(input$random_order),rot.per=input$rot_per,color=colors)
  })
  output$barplot <- renderPlot({
    
    arg <-compute()
    barplot(arg)
  })
  
  output$table <- renderTable({
    
    arg<-compute()
    temp.freq <- as.integer(arg[which(arg>=isolate(input$min_num))])
    temp.word <- names(which(arg>=isolate(input$min_num)))
    result.df<-data.frame(temp.word,temp.freq)
    colnames(result.df)<-c("단어","빈도수")
    result.df
  })
}
)