# succincteR
RStudio Addin to Create a .R script from .Rmd
This addin calls `knitr::purl` on the active .Rmd file and generates a .R file of the same name, containing just the contents of the code chunks. If a .R file of the same name as the .Rmd file already exists it *will not* be overwritten.

** WARNING ** This addin does not parse the chunk options, so the resulting .R file could include code from other language engines or R code that was not meant to be evaluated. These would be nice things to have fixed. The chunk options are included in the .R file as comments (see `?purl`)

# Example

If you have a test.Rmd file containing the following:

***
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas pellentesque leo sit amet rhoncus imperdiet. Sed ultricies erat arcu, posuere posuere dui fringilla ac. Vivamus luctus, leo sit amet vehicula tempor, justo elit laoreet sem, quis pretium justo turpis nec leo. Integer id mattis mi, vitae consectetur urna. Sed laoreet ut dui eu gravida. Maecenas mi purus, laoreet a quam nec, pellentesque vestibulum mi. Quisque ac venenatis dui. Quisque consequat sapien quis ornare hendrerit. Etiam lobortis eros vitae elit consequat, non ullamcorper enim feugiat. Nam nec arcu vel neque lobortis ullamcorper vitae eget metus. Mauris vitae posuere nunc. 



```{r eval=FALSE}
print("Hello World")
```
***

You get a test.R file containing:

****

```
##---eval=FALSE------------
print("Hello World")
```
