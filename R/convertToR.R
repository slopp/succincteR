#' convertToR
#'
#' Parses an .Rmd file and returns the R code from the R code chunks in a single .R file.
#' WARNING! The resultant R file might contain other code besides R (if you've used other chunk engines)
#' and/or code that was not meant to be evaluated.
#'
#' @return .R file
#' @export

convertToR <- function() {
  rmdPath <- path.expand(rstudioapi::getActiveDocumentContext()$path)
  .dir <- dirname(rmdPath)
  fileExt <- tools::file_ext(basename(rmdPath))

  if (!identical(fileExt, "Rmd")) stop("Must be in an Rmd before calling addin")

  rmdName <- sub(pattern = paste0(".", fileExt),
                 replacement="",
                 fixed = TRUE,
                 basename(rmdPath))

  rPath <- paste0(.dir, "/", rmdName, ".R")

  if (file.exists(rPath)) stop("R file already exists with the same name as .Rmd file.")

  knitr::purl(rmdPath, rPath)
  rstudioapi::navigateToFile(rPath)

}



