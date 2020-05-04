library(shiny)
library(shinydashboard)

# Define UI
ui <- dashboardPage(
  dashboardHeader(title = "Wordcloud Berita Olahraga"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Wordcloud", tabName = "wc",icon = icon("tasks")),
      #menuItem("Alarm Lv.1", tabName = "alarm1",icon = icon("info-circle")),
      #menuItem("Alarm Lv.2", tabName = "alarm2",icon = icon("info-circle")),
      menuItem("Raw Data", tabName = "rawdata",icon = icon("database"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "wc",
              h3("Statistic Info"),
              fluidRow(
                valueBoxOutput("MostTalked"),
                valueBoxOutput("totalBerita"),
                valueBoxOutput("totalRows"),
                
                box(
                  plotOutput("Wordcloud"))
              )
      ),
      tabItem(tabName = "rawdata",
              h3("Raw Data Live Chat (Visitor Side)"),
              DT::dataTableOutput("rawdata")        
      )
    )   
  )
)


# Define Server
server <- function(input,output){
  news <- read.csv(file="news data example.csv",header=TRUE,sep = ";")
  
  #### =====================  Wordcloud in visitor side  ============================ #####
  ###====== Data Cleaning untuk visitor
  news.f <- news$text # Mengambil variabel text saja
  news1 <- paste(news.f,collapse = " ") #mengubah beberapa baris menjadi 1 baris
  news2 <- gsub(pattern="\\W",replace=" ",news1) #mengganti pola +-?! ke space
  news3 <- gsub(pattern="\\d",replace=" ",news2) #mengganti pola angka ke space
  news4 <- gsub(pattern="\\b[A-z]\\b[1]",replace=" ",news3) #mengganti karakter 1 huruf ke space
  news5 <- tolower(news4) #mengubah ke kalimat font kecil
  
  library(tm)
  library(DT)
  library(NLP)
  library(RColorBrewer)
  library(ggplot2)
  
  ## List daftar kata "commmon"
  stopwords <- c("saat","akan","dkk","lalu","sebelum","agar","saja","tak","itu",
                 "beberapa","mereka","apalagi","diri","ini","bagi","adalah",
                 "hanya","yang","untuk","jadi","hingga","di","dengan","tapi","dan")
  
  news6 <- removeWords(news5,stopwords) #menghapus kata-kata yang tidak penting (very common)
  df <- stripWhitespace(news6) #merapikan jarak antar kata menjadi 1 spasi 
  
  # wordcloud analysis
  library(stringr)
  library(wordcloud) 
  news.c <- unlist(str_split(df,pattern = "\\s+")) #Mengekstrak kalimat menjadi kata-kata yang tunggal
  
  news.freq.t <- table(news.c)
  sort.news.freq.t <- sort(news.freq.t,decreasing = TRUE)
  sort.news.freq.df <- as.data.frame(sort.news.freq.t[1:15])
  Top_Word <- as.data.frame(sort.news.freq.t[1:15])
  p1 <- Top_Word$news.c[1]
  
  #===== Output Part  
  output$Wordcloud <- renderPlot({
    pal2 <- brewer.pal(8,"Dark2")
    wordcloud(news.c,min.freq=300,max.words=50,rot.per=0.30,scale=c(4,1),random.order=FALSE,color=pal2)
  })
  
  output$MostTalked <- renderValueBox({
    valueBox(
      p1, "Most Talked", icon = icon("star"),
      color = "red"
    )
  }) 
  
  output$totalBerita <- renderValueBox({
    valueBox(
      length(unique(news$news_Id)) , "Total Berita", icon = icon("quote-right"),
      color = "yellow"
    )
  })
  
  output$totalRows <- renderValueBox({
    valueBox(
      nrow(news), "Total Rows", icon = icon("user-circle"),
      color = "olive"
    )
  })
  
  output$rawdata <- DT::renderDataTable({
    news
  })
  
}

shinyApp(ui, server)
