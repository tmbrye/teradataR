SIGN <- function(x)
{
  asTdExpr <- function(x) {class(x) <- "td.expression"; return(x)}

  pfmt <- "SIGN(%s)"
  if(inherits(x, "td.data.frame"))
  {
    if(length(x) == 1)
    {
      if(!is.null(attr(x, "expressions")))
        val <- attr(x, "expressions")[[names(x)]]
      else
        val <- names(x)

    }
    else
    {
      message("SIGN warning:  td.data.frame 'x' has length > 1 using first element")
      val <- names(x)[1]
    }

    return(asTdExpr(gettextf(pfmt, val)))

  }

  if(inherits(x, "character") || inherits(x,"td.expression") ||
     inherits(x, "numeric"))
  {
    return(asTdExpr(paste("SIGN(", x, ")", sep="")))
  }
}
