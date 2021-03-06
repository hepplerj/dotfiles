# Rprofile settings

# Jason A. Heppler | jason@jasonheppler.org | https://jasonheppler.org
# MIT License <http://heppler.mit-license.org/>

# Some settings from these useRs:
# http://gettinggeneticsdone.blogspot.com/2013/07/customize-rprofile.html?m=1
# http://inundata.org/2011/09/29/customizing-your-rprofile/
# http://kevinushey.github.io/blog/2015/02/02/rprofile-essentials/
# https://github.com/lmullen/dotfiles/blob/master/r/Rprofile.symlink

options(
       width = 80,
       repos = c(CRAN = "https://cloud.r-project.org"),
       download.file.method = "libcurl",
       useFancyQuotes = FALSE,
       menu.graphics = FALSE,
       editor = "vim",
       browserNLdisabled = TRUE,
       #max.print = 1e3,
       Ncpus = 8L,
       devtools.name = "Jason Heppler",
       devtools.desc = list(
        "Authors@R" = 'c(person("Jason", "Heppler", role = c("aut", "cre"),
        email = "jason@jasonheppler.org"))',
        License = "MIT + file LICENSE",
        Version = "0.0.0.9000",
        VignetteBuilder = "knitr",
        URL = "https://github.com/hepplerj/pkgname",
        BugReports = "https://github.com/hepplerj/pkgname/issues",
        LazyData = "yes"
       )
)

# enable autocompletions for package names in
# `require()`, `library()`
utils::rc.settings(ipck = TRUE)

Sys.setenv(R_PACKRAT_CACHE_DIR='~/R/packrat/')
Sys.setenv(R_HISTSIZE='10000')
Sys.setenv(TZ = "America/Chicago")

if(interactive()){

  # Create a new invisible environment for all the functions to go
  # in so it doesn't clutter the workspace.
  .env <- new.env()

  # Wrapper around object.size to print it with human readable units
  .env$os <- function(object) print(object.size(object), units = "auto")

  # Override q() to not save by default. Same as saying q("no").
  .env$q <- function(save = "no", ...) {
    quit(save = save, ...)
  }

  # Open the current working directory in Nautilus/Finder
  .env$o <- function() {
    if(Sys.info()[1]=="Linux") system("xdg-open .")
      if(Sys.info()[1]=="Darwin") system("open .")
  }

  # Attach all the variables above
  attach(.env, warn.conflicts = FALSE)

}

# Print library paths on startup
if (length(.libPaths()) > 1) {
  msg <- "Using libraries at paths:\n"
} else {
  msg <- "Using library at path:\n"
}
libs <- paste("-", .libPaths(), collapse = "\n")
message(msg, libs, sep = "")

# Don't blow up console
options(max.print = 100)

.First <- function() {
  if (interactive()) {
    cat("\nLoaded .Rprofile at", date(), "\n\n")
  }
}

.Last <- function() {
  if (interactive()) {
    cat("\nExiting R at", date(), "\n\n")
  }
}

# On load, synchronize the RStudio editor theme to the OS appearance using the darkly package
  setHook("rstudio.sessionInit", function(newSession) if (interactive() & require("darkly", quietly = TRUE)) darkly::darkly_sync(), action = "append")
