library(tidyverse)
arquivosCSV <- unlist(lapply(c("listasCSV", "listasRecebidasPorEmail"), list.files, pattern="csv", full.names=TRUE))

df = data.frame(matrix(vector(), 0, 5,
                       dimnames=list(c(), c("titulo", "autora", "preço capa", "preço feira", "editora"))),
                stringsAsFactors=F)


for (i in 1:length(arquivosCSV)) {
  nomeArquivo <- arquivosCSV[i]
  
  arquivo <- read_csv(nomeArquivo, col_names=FALSE)
  numeroColunas <- ncol(arquivo)
  if (numeroColunas != 4) {
    next
  }

  colnames(arquivo) <- c("titulo", "autora", "preço capa", "preço feira")
  
  nomeEditora <- strsplit(nomeArquivo, "/")
  nomeEditora <- nomeEditora[[1]][2]
  nomeEditora <- URLdecode(nomeEditora)
  nomeEditora <- gsub(".csv", "", nomeEditora)
  print(nomeEditora)
  
  
  arquivo$editora <- nomeEditora
  
  df <- rbind(df, arquivo)
  
}

save(df, file = "feiraUSP.Rdata")
