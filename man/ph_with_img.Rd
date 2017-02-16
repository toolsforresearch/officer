% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ppt_placeholder.R
\name{ph_with_img}
\alias{ph_with_img}
\title{add image into a new shape}
\usage{
ph_with_img(x, src, type = "body", index = 1, width = NULL,
  height = NULL)
}
\arguments{
\item{x}{a pptx device}

\item{src}{image path}

\item{type}{placeholder type}

\item{index}{placeholder index (integer). This is to be used when a placeholder type
is not unique in the current slide, e.g. two placeholders with type 'body'.}

\item{width, height}{image size in inches}
}
\description{
add an image into a new shape in a slide
}
\examples{
fileout <- tempfile(fileext = ".pptx")
doc <- read_pptx()
doc <- add_slide(doc, layout = "Title and Content", master = "Office Theme")

img.file <- file.path( Sys.getenv("R_HOME"), "doc", "html", "logo.jpg" )
if( file.exists(img.file) ){
  doc <- ph_with_img(x = doc, type = "body", src = img.file, height = 1.06, width = 1.39 )
}
if( require("ionicons") ){
  calendar_src = as_png(name = "calendar", fill = "#FFE64D", width = 144, height = 144)
  doc <- ph_with_img(x = doc, type = "dt", src = calendar_src )
}
if( require("devEMF") ){
  emf("bar.emf")
  barplot(1:10, col = 1:10)
  dev.off()
  doc <- add_slide(doc, layout = "Title and Content", master = "Office Theme")
  doc <- ph_with_img(x = doc, type = "body", src = "bar.emf" )
}

print(doc, target = fileout )
}