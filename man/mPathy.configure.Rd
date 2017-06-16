\name{mPathy.configure}
\alias{mPathy.configure}
\title{
Setting global configuration
}
\description{
Functions in mPathy use shared global variables that are not constant but can be adjusted to your liking. This global settings are set by the user with this function.
}
\usage{
mPathy.configure(...)
}
\arguments{
  \item{\dots}{
%%     ~~Describe \code{\dots} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\author{
Sebastian Gross
}
\note{
%%
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (...) 
{
    if (length(c(...)) == 0) 
        return()
    edit.ConfigFile.Keys(...)
  }
}
\keyword{settings}
\keyword{preferences}
