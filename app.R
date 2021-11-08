library(shiny)
library(DT)

load("feiraUSP.Rdata")

shinyApp(
  ui <- fluidPage(
    titlePanel("Catálogo Parcial Feira da USP"),

    sidebarLayout(
      sidebarPanel(
        h3("Experimental"),
        h5("Para fins de pesquisa apenas"),
        h5("Nenhuma relação com a USP ou com a feira da USP")
      ),
      mainPanel(
        h5("A tabela abaixo foi extraída de PDFs e compilada automaticamente."),
        h5("Cerca de 110 das 200+ editoras presentes na Feira da USP estão disponíveis."),
        h5("Use a função 'Search' para pesquisar algum autor ou título."),
        h5("Exemplo: Dalloway")
      )
    ),
    
    DTOutput('tbl')),
  server = function(input, output) {
    output$tbl = renderDT(
      df, options = list(lengthChange = FALSE)
    )
  }
)