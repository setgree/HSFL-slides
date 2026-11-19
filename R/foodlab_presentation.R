#' Food Lab beamer presentation
#'
#' A `beamer_presentation` that loads the Food Lab theme, logo, footer and
#' emoji support straight from the installed package, so a deck folder only
#' needs its Rmd and images. Use it in the YAML as
#' `output: foodlabslides::foodlab_presentation`.
#'
#' Unless the YAML sets them, `classoption` defaults to `aspectratio=169` and
#' `urlcolor` and `linkcolor` to `blue`.
#'
#' @param footer_url Optional link to show in the middle of the footer, e.g.
#'   `"https://github.com/setgree/presentations/"`. The visible text is the URL
#'   without `https://` and the trailing slash.
#' @param show_title_slide Set to `FALSE` to drop the title slide.
#' @param slide_level,latex_engine,highlight Passed to `beamer_presentation`.
#' @param includes Extra `includes`; the Food Lab header always comes first.
#' @param pandoc_args Extra pandoc arguments.
#' @param ... Other arguments passed to [rmarkdown::beamer_presentation()].
#' @export
foodlab_presentation <- function(footer_url = NULL,
                                 show_title_slide = TRUE,
                                 slide_level = 2,
                                 latex_engine = "lualatex",
                                 highlight = "tango",
                                 includes = NULL,
                                 pandoc_args = NULL,
                                 ...) {
  resources <- foodlab_resources()

  header <- tempfile("foodlab-header-", fileext = ".tex")
  writeLines(foodlab_header(resources, footer_url), header)

  includes <- rmarkdown::includes(
    in_header = c(header, includes$in_header),
    before_body = includes$before_body,
    after_body = includes$after_body
  )

  if (!isTRUE(show_title_slide)) {
    pandoc_args <- c(pandoc_args, paste0("--lua-filter=",
                                         file.path(resources, "suppress_title.lua")))
  }

  fmt <- rmarkdown::beamer_presentation(
    slide_level = slide_level,
    latex_engine = latex_engine,
    highlight = highlight,
    includes = includes,
    pandoc_args = pandoc_args,
    ...
  )

  # Defaults the YAML can override
  base_pre_processor <- fmt$pre_processor
  fmt$pre_processor <- function(metadata, input_file, runtime, knit_meta,
                                files_dir, output_dir) {
    args <- if (is.function(base_pre_processor)) {
      base_pre_processor(metadata, input_file, runtime, knit_meta, files_dir, output_dir)
    }
    defaults <- c(classoption = "aspectratio=169", urlcolor = "blue", linkcolor = "blue")
    for (name in names(defaults)) {
      if (is.null(metadata[[name]])) {
        args <- c(args, rmarkdown::pandoc_variable_arg(name, defaults[[name]]))
      }
    }
    args
  }

  # lualatex draws emoji via temp PNGs in luatex.* folders, which Dropbox
  # sometimes keeps after the build; clear them before and after each knit
  deck_dir <- NULL
  clear_luatex <- function() {
    if (!is.null(deck_dir)) {
      unlink(Sys.glob(file.path(deck_dir, "luatex.*")), recursive = TRUE)
    }
  }
  base_pre_knit <- fmt$pre_knit
  fmt$pre_knit <- function(input, ...) {
    deck_dir <<- dirname(normalizePath(input))
    clear_luatex()
    if (is.function(base_pre_knit)) base_pre_knit(input, ...)
  }
  base_on_exit <- fmt$on_exit
  fmt$on_exit <- function() {
    clear_luatex()
    if (is.function(base_on_exit)) base_on_exit()
  }

  fmt
}

foodlab_resources <- function() {
  path <- system.file("rmarkdown/templates/foodlab_presentation/resources",
                      package = "foodlabslides", mustWork = TRUE)
  # LaTeX can't take spaces in \input@path (e.g. C:/Program Files on Windows)
  if (.Platform$OS.type == "windows") path <- utils::shortPathName(path)
  gsub("\\\\", "/", normalizePath(path))
}

foodlab_header <- function(resources, footer_url = NULL) {
  footer <- NULL
  if (!is.null(footer_url) && nzchar(footer_url)) {
    shown <- sub("/$", "", sub("^https?://", "", footer_url))
    footer <- sprintf("\\renewcommand{\\foodlabfooter}{\\href{%s}{%s}}",
                      footer_url, shown)
  }
  c(
    "% Food Lab theme, logo and preamble, loaded from the foodlabslides package",
    "\\makeatletter",
    sprintf("\\def\\input@path{{%s/}}", resources),
    "\\makeatother",
    readLines(file.path(resources, "preamble.tex")),
    # graphicx under lualatex ignores \input@path, so the logo gets its full path
    sprintf("\\logo{\\includegraphics[height=0.6cm]{%s/foodlab-logo.png}}", resources),
    footer
  )
}
