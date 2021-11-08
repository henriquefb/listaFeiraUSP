library(rvest)
library(xml2)

extrairLinksPagina <- function(inputURL) {
  paginaHTML <- read_html(inputURL)
  
  linksPagina <- paginaHTML %>% 
    rvest::html_nodes('body') %>% 
    xml2::xml_find_all("//a/@href") %>% 
    rvest::html_text()
  
  r <- grep('/.', linksPagina)
  linksPagina <- linksPagina[r]
  
  linksPagina <- unique(linksPagina)
  
  return(linksPagina)
}

listaEditoras <- list()

for (numeroPagina in 0:5) {
  urlPagina <- paste0("https://festadolivro.edusp.com.br/editoras?title=&page=", numeroPagina)
  listaEditoras <- c(listaEditoras, extrairLinksPagina(urlPagina))
}

baixarPDF <- function(x) {
  editoraURL <- paste0("https://festadolivro.edusp.com.br", x)
  linkParaPDF <- extrairLinksPagina(editoraURL)
  r <- grep(".pdf", linkParaPDF)
  linkParaPDF <- linkParaPDF[r]
  print(linkParaPDF)
  
  nomeDoPDF <- strsplit(linkParaPDF, "/")
  nomeDoPDF <- nomeDoPDF[[1]][length(nomeDoPDF[[1]])]
  nomeDoPDF <- paste0("listasEditoras/", nomeDoPDF)
  print(nomeDoPDF)
  
  try(download.file(linkParaPDF, nomeDoPDF, mode="wb"))
}

lapply(listaEditoras, baixarPDF)




