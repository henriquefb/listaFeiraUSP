library(shiny)
library(DT)

load("feiraUSP.Rdata")

shinyApp(
  ui <- fluidPage(
    titlePanel("Catálogo Parcial Feira da USP"),

    sidebarLayout(
      sidebarPanel(
        h4("App disponibilizado em caráter experimental"),
        h4("Autor: Henrique Barbosa"),
        h5("Para fins de pesquisa apenas"),
        h5("Nenhuma relação com o evento."),
        h5("Contato:"),
        h6("henriquefb arroba icloud ponto com")
      ),
      mainPanel(
        h5("A tabela abaixo foi extraída dos PDFs das editoras e compilada automaticamente."),
        h5("Cerca de 110 das 200+ editoras presentes na Feira da USP estão disponíveis."),
        h5("Use a função 'Search' para pesquisar algum autor ou título."),
        h5("Exemplo: Geisler")
      )
    ),
    
    DTOutput('tbl')),
  server = function(input, output) {
    output$tbl = renderDT(
      df, options = list(lengthChange = FALSE)
    )
  }
)