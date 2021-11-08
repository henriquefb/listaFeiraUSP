import tabula
import os
import glob

for filepath in glob.iglob('listasEditoras/*.pdf'):
    inputpdf = filepath
    outputpdf = inputpdf.replace("pdf","csv")
    outputpdf = outputpdf.replace("listasEditoras", "listasCSV")
    tabula.convert_into(inputpdf, outputpdf, output_format="csv", pages="all")
    print(outputpdf)



