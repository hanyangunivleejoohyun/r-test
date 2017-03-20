library(shiny)
shinyUI(fluidPage(
  titlePanel("Wordcloud in Moby Dick example"),
  
  # 사이드바 UI
  sidebarLayout(
    sidebarPanel( 
      textInput("word", label = h3("분석할 단어를 입력해주세요(example : dog)"), value=""),
      textInput("num", label = h3("문맥 분석할 앞,뒤 단어수를 입력해주세요."), value = "3"),
      sliderInput("scale", label="빈도수에 따라 표현될 글자 크기를 입력해주세요", min = 0.5,max = 7, value = c(0.5, 5)),
      numericInput("min_num", label = "워드 클라우드에 표현하고 싶은
                   최소 빈도수를 입력해주세요", value = 2,min=1),
      sliderInput("rot_per", label="값이 높을수록 수직으로 표현되는 단어의 수가 늘어납니다.", min = 0,max = 1, value =0.3),
      checkboxInput("random_order", label="단어 위치 임의 지정", value =F),
      actionButton("goButton", "Go!")
    ),
    mainPanel( # 메인 패널은 tab을 이용하여 여러자료를 표현할 수 있게했습니다. 들어가 있는 내용은 일단 임의로 넣었고
               # 차후에 혹시라도 하나의 자료에 대해서 여러가지의 시각화를 하게되면 활용 가능할것 같습니다.
      tabsetPanel(type = "tabs", 
                  tabPanel("Plot", plotOutput("plot")), 
                  tabPanel("barplot", plotOutput("barplot")),
                  tabPanel("table",h3("문맥 분석 결과 도출된 단어 빈도수 입니다."), tableOutput("table"))
    )
  )
  )
  )
)