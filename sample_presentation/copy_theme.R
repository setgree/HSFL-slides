# This file is sourced when creating a new presentation
# It copies the Beamer theme to the working directory

theme_path <- system.file(
  "rmarkdown/templates/foodlab_presentation/resources/beamerthemeFoodLab.sty",
  package = "foodlabslides"
)

if (file.exists(theme_path)) {
  file.copy(theme_path, "beamerthemeFoodLab.sty", overwrite = TRUE)
}
