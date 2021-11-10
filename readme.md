# Catálogo Parcial da Feira de livros EDUSP

Monta uma base de dados parcial dos livros disponíveis na Feira do Livro da USP (https://festadolivro.edusp.com.br) e publica um aplicativo baseado em R Shiny para busca dinâmica da base de dados.

## Conteúdo

[app.R] - monta e publica o app na plataforma Shinyapps

[listasEditoras] - contém as listas em PDF coletadas do site oficial do evento

[listasCSV] - contém as listas convertidas para CSV. Necessário uso do aplicativo tabula (https://github.com/tabulapdf/tabula)

[listasRecebidasPorEmail] - contém listas enviadas pra mim diretamente por email (ex. Companhia das Letras)

Eu fiz o trabalho em cerca de três horas e sozinho, então tanto a base de dados quanto o Shiny app em si estão bem aquém da qualidade que eu gostaria que tivessem profissionalmente. Aceito sugestões e Pull Requests!

## Como reproduzir a base de dados

Para reproduzir a base de dados deve-se primeiro rodar o arquivo feiraUSPColetandoListas.R - que faz o download automaticamente de todos os PDF disponíveis no site.

Em seguida, o arquivo extraindoPDF.py usa o aplicativo TABULA para extrair automaticamente as tabelas dos pdf e salvar em uma pasta com todos os csv.

Finalmente, o arquivo compilandoTabelas.R monta a base de dados com todos os arquivos CSV que têm 4 colunas (não tenho recursos para ajeitar a formatação de todos os 233 CSV, usei esse método para montar um MVP), e o arquivo app.R publica o app para a plataforma Shiny.
