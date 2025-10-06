#!/usr/bin/env Rscript
# Food Lab Slides Package Setup Script
# Run this script to automatically create the entire package structure

# Set the parent directory where you want to create the package
# Change this to your desired location

# Create main package directory
pkg_dir <- './'
dir.create(pkg_dir, showWarnings = FALSE)
setwd(pkg_dir)

cat("Creating package structure in:", pkg_dir, "\n\n")

# Create directory structure
dirs <- c(
  "inst/rmarkdown/templates/foodlab_presentation/skeleton",
  "inst/rmarkdown/templates/foodlab_presentation/resources",
  "R"
)

for (dir in dirs) {
  dir.create(dir, recursive = TRUE, showWarnings = FALSE)
  cat("✓ Created:", dir, "\n")
}

# Create DESCRIPTION file
cat('Package: foodlabslides
Type: Package
Title: R Markdown Template for Food Lab Presentations
Version: 0.1.0
Authors@R: person("Food Lab", "Stanford", email = "foodlab@stanford.edu", role = c("aut", "cre"))
Description: Provides an R Markdown template for creating Beamer presentations
    with Food Lab and Stanford University branding.
License: MIT + file LICENSE
Encoding: UTF-8
LazyData: true
RoxygenNote: 7.2.3
Imports:
    rmarkdown (>= 2.0)
Suggests:
    knitr
VignetteBuilder: knitr
', file = "DESCRIPTION")
cat("✓ Created: DESCRIPTION\n")

# Create LICENSE
cat('MIT License

Copyright (c) 2025 Stanford Food Lab

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
', file = "LICENSE")
cat("✓ Created: LICENSE\n")

# Create .Rbuildignore
cat('^.*\\.Rproj$
^\\.Rproj\\.user$
^\\.github$
^setup_package\\.R$
', file = ".Rbuildignore")
cat("✓ Created: .Rbuildignore\n")

# Create .gitignore
cat('.Rproj.user
.Rhistory
.RData
.Ruserdata
*.Rproj
', file = ".gitignore")
cat("✓ Created: .gitignore\n")

# Create template.yaml
cat('name: Food Lab Presentation
description: Create a Beamer presentation with Food Lab and Stanford branding. Uses Stanford Cardinal red, warm beige backgrounds, and includes the Food Lab logo on each slide.
create_dir: false
', file = "inst/rmarkdown/templates/foodlab_presentation/template.yaml")
cat("✓ Created: template.yaml\n")

# Create beamerthemeFoodLab.sty
cat('% Food Lab Beamer Theme
% Based on Stanford theme by Sanha Cheong

\\mode<presentation>

% Color definitions
\\definecolor{FoodLabBeige}{HTML}{E8E1D3}
\\definecolor{StanfordCardinal}{HTML}{8C1515}
\\definecolor{DarkGray}{HTML}{2E2D29}

% Settings
\\useinnertheme{rectangles}
\\useoutertheme[subsection=false]{miniframes}
\\usecolortheme{whale}

% Color theme
\\setbeamercolor{structure}{fg=StanfordCardinal}
\\setbeamercolor{palette primary}{fg=DarkGray, bg=FoodLabBeige}
\\setbeamercolor{palette secondary}{fg=white, bg=StanfordCardinal}
\\setbeamercolor{palette tertiary}{fg=white, bg=DarkGray}
\\setbeamercolor{palette quaternary}{fg=white, bg=StanfordCardinal}

\\setbeamercolor{title}{fg=StanfordCardinal}
\\setbeamercolor{frametitle}{fg=StanfordCardinal, bg=FoodLabBeige}
\\setbeamercolor{section in head/foot}{fg=white, bg=StanfordCardinal}
\\setbeamercolor{subsection in head/foot}{fg=white, bg=DarkGray}

\\setbeamercolor{item}{fg=StanfordCardinal}
\\setbeamercolor{subitem}{fg=DarkGray}
\\setbeamercolor{itemize/enumerate subbody}{fg=DarkGray}

\\setbeamercolor{block title}{fg=white, bg=StanfordCardinal}
\\setbeamercolor{block body}{fg=DarkGray, bg=FoodLabBeige!50}

\\setbeamercolor{block title example}{fg=white, bg=DarkGray}
\\setbeamercolor{block body example}{fg=DarkGray, bg=FoodLabBeige!50}

\\setbeamercolor{block title alerted}{fg=white, bg=StanfordCardinal!80}
\\setbeamercolor{block body alerted}{fg=DarkGray, bg=FoodLabBeige!50}

% Background
\\setbeamercolor{background canvas}{bg=FoodLabBeige}

% Fonts
\\usefonttheme{professionalfonts}
\\usefonttheme{serif}
\\setbeamerfont{title}{size=\\Large, series=\\bfseries}
\\setbeamerfont{subtitle}{size=\\large, series=\\normalfont}
\\setbeamerfont{frametitle}{size=\\large, series=\\bfseries}
\\setbeamerfont{framesubtitle}{size=\\small, series=\\normalfont}

% Remove navigation symbols
\\setbeamertemplate{navigation symbols}{}

% Frame title
\\setbeamertemplate{frametitle}{
  \\vspace{0.3cm}
  \\insertframetitle
  \\vspace{0.2cm}
}

% Title page
\\setbeamertemplate{title page}{
  \\vbox{}
  \\vfill
  \\begingroup
    \\centering
    \\begin{beamercolorbox}[sep=8pt,center]{title}
      \\usebeamerfont{title}\\inserttitle\\par%
      \\ifx\\insertsubtitle\\@empty%
      \\else%
        \\vskip0.25em%
        {\\usebeamerfont{subtitle}\\usebeamercolor[fg]{subtitle}\\insertsubtitle\\par}%
      \\fi%     
    \\end{beamercolorbox}%
    \\vskip1em\\par
    \\begin{beamercolorbox}[sep=8pt,center]{author}
      \\usebeamerfont{author}\\insertauthor
    \\end{beamercolorbox}
    \\begin{beamercolorbox}[sep=8pt,center]{institute}
      \\usebeamerfont{institute}\\insertinstitute
    \\end{beamercolorbox}
    \\begin{beamercolorbox}[sep=8pt,center]{date}
      \\usebeamerfont{date}\\insertdate
    \\end{beamercolorbox}\\vskip0.5em
  \\endgroup
  \\vfill
}

% Footer with logo
\\setbeamertemplate{footline}{
  \\leavevmode%
  \\hbox{%
    \\begin{beamercolorbox}[wd=.15\\paperwidth,ht=2.5ex,dp=1.125ex,left]{palette quaternary}%
      \\hspace{0.3cm}
      \\ifx\\insertframenumber\\@empty%
      \\else%
        \\insertframenumber{} / \\inserttotalframenumber
      \\fi%
    \\end{beamercolorbox}%
    \\begin{beamercolorbox}[wd=.70\\paperwidth,ht=2.5ex,dp=1.125ex,center]{palette primary}%
      % Space for logo (will be added via \\logo command in .Rmd)
    \\end{beamercolorbox}%
    \\begin{beamercolorbox}[wd=.15\\paperwidth,ht=2.5ex,dp=1.125ex,right]{palette quaternary}%
      \\hspace{0.3cm}
    \\end{beamercolorbox}%
  }%
  \\vskip0pt%
}

% Logo positioning
\\setbeamertemplate{sidebar right}{
  \\vfill
  \\llap{\\insertlogo\\hskip0.1cm}
  \\vskip2pt
}

\\mode<all>
', file = "inst/rmarkdown/templates/foodlab_presentation/resources/beamerthemeFoodLab.sty")
cat("✓ Created: beamerthemeFoodLab.sty\n")

# Create preamble.tex
cat('% Food Lab Presentation Preamble

% Font packages
\\usepackage{sourcesanspro}
\\usepackage{sourceserifpro}

% Additional packages
\\usepackage{graphicx}
\\usepackage{booktabs}
\\usepackage{hyperref}

% Hyperlink colors
\\hypersetup{
    colorlinks=true,
    linkcolor=.,
    urlcolor={red!80!black},
    citecolor={red!80!black}
}

% Logo (adjust path as needed)
% Place foodlab-logo.png in the same directory as your .Rmd file
\\logo{\\includegraphics[height=0.6cm]{foodlab-logo.png}}

% Custom commands for blocks
\\newenvironment{block}[1]{%
  \\begin{beamerboxesrounded}[upper=block title,lower=block body,shadow=true]{#1}}
  {\\end{beamerboxesrounded}}

% Adjust spacing
\\setlength{\\parskip}{0.5em}
', file = "inst/rmarkdown/templates/foodlab_presentation/skeleton/preamble.tex")
cat("✓ Created: preamble.tex\n")

# Create a helper file that copies the theme
cat('# This file is sourced when creating a new presentation
# It copies the Beamer theme to the working directory

theme_path <- system.file(
  "rmarkdown/templates/foodlab_presentation/resources/beamerthemeFoodLab.sty",
  package = "foodlabslides"
)

if (file.exists(theme_path)) {
  file.copy(theme_path, "beamerthemeFoodLab.sty", overwrite = TRUE)
}
', file = "inst/rmarkdown/templates/foodlab_presentation/skeleton/copy_theme.R")
cat("✓ Created: copy_theme.R\n")

# Create skeleton.Rmd
cat('---
title: "Your Presentation Title"
subtitle: "Optional Subtitle"
author: "Your Name"
institute: "Humane & Sustainable Food Lab, Stanford University"
date: "`r Sys.Date()`"
output:
  beamer_presentation:
    theme: "FoodLab"
    colortheme: "default"
    fonttheme: "default"
    slide_level: 2
    keep_tex: false
    includes:
      in_header: preamble.tex
classoption: "aspectratio=169"
---

```{r setup, include=FALSE}
# Copy theme file to working directory
theme_path <- system.file(
  "rmarkdown/templates/foodlab_presentation/resources/beamerthemeFoodLab.sty",
  package = "foodlabslides"
)
if (file.exists(theme_path)) {
  file.copy(theme_path, "beamerthemeFoodLab.sty", overwrite = TRUE)
}

knitr::opts_chunk$set(echo = FALSE, warning = FALSE, message = FALSE,
                      fig.align = \'center\', out.width = \'80%\')
library(ggplot2)
# Set ggplot theme to match presentation
theme_set(theme_minimal(base_size = 14) + 
          theme(plot.background = element_rect(fill = "#E8E1D3", color = NA),
                panel.background = element_rect(fill = "#E8E1D3", color = NA)))
```

# Introduction

## Research Overview

This is a sample slide demonstrating the Food Lab presentation template.

Key features:

- Clean, minimal design
- Stanford Cardinal red accents
- Food Lab branding
- Easy to customize

## Using R Code

```{r cars-plot, fig.cap="Sample plot with matching theme"}
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point(color = "#8C1515", size = 3) +
  geom_smooth(method = "lm", color = "#2E2D29", se = TRUE, alpha = 0.2) +
  labs(title = "Fuel Efficiency vs Weight",
       x = "Weight (1000 lbs)",
       y = "Miles per Gallon")
```

# Methods

## Study Design

You can include:

- Bullet points
- **Bold text**
- *Italic text*
- `Code snippets`

## Data Analysis

::: {.columns}
:::: {.column width="50%"}
**Quantitative**

- Statistical models
- Effect sizes
- Confidence intervals
::::

:::: {.column width="50%"}
**Qualitative**

- Thematic analysis
- Case studies
- Interviews
::::
:::

# Results

## Main Findings

:::block
### Key Result
This is an important finding highlighted in a block.
:::

Additional context and interpretation of results.

## Statistical Analysis

```{r table-example}
knitr::kable(head(mtcars[, 1:4], 5),
             caption = "Sample data table",
             booktabs = TRUE)
```

# Discussion

## Implications

1. First major implication
2. Second major implication
3. Future directions

## Acknowledgments

- Funding sources
- Collaborators
- Lab members

\\vspace{1cm}

\\centering
**Thank you!**

Questions?
', file = "inst/rmarkdown/templates/foodlab_presentation/skeleton/skeleton.Rmd")
cat("✓ Created: skeleton.Rmd\n")

# Create README.md
cat('# Food Lab Slides

R Markdown template for creating Beamer presentations with Humane & Sustainable Food Lab and Stanford University branding.

## Installation

Install directly from GitHub:

```r
# Install devtools if you haven\'t already
install.packages("devtools")

# Install foodlabslides
devtools::install_github("setgree/foodlabslides")
```

## Requirements

- R (>= 4.0)
- RStudio (recommended)
- LaTeX distribution (TinyTeX, MacTeX, or MiKTeX)
  - If you don\'t have LaTeX: `install.packages("tinytex"); tinytex::install_tinytex()`

## Setup

### 1. Add the Food Lab logo

Download the Food Lab logo and save it as `foodlab-logo.png` in your R project directory (same folder as your .Rmd file).

You can download the logo from: https://www.foodlabstanford.com/

### 2. Create a new presentation

In RStudio:
1. **File → New File → R Markdown...**
2. Click **"From Template"**
3. Select **"Food Lab Presentation"**
4. Choose a name and location
5. Click **OK**

### 3. Customize your presentation

Edit the YAML header:

```yaml
---
title: "Your Presentation Title"
subtitle: "Optional Subtitle"
author: "Your Name"
institute: "Humane & Sustainable Food Lab, Stanford University"
date: "`r Sys.Date()`"
---
```

### 4. Knit to PDF

Click the **Knit** button or press `Cmd/Ctrl + Shift + K`

## Features

- **Stanford branding**: Uses official Stanford Cardinal red (#8C1515)
- **Clean design**: Warm beige background with professional typography
- **Food Lab logo**: Appears on each slide footer
- **R code integration**: Include plots, tables, and analysis
- **Easy markdown**: Write in simple markdown syntax

## Slide Structure

### Creating slides

Use `##` for new slides:

```markdown
## Slide Title

Content goes here
```

### Section breaks

Use `#` for section titles:

```markdown
# Methods
```

### Columns

Create two-column layouts:

```markdown
::: {.columns}
:::: {.column width="50%"}
Left column content
::::

:::: {.column width="50%"}
Right column content
::::
:::
```

### Highlighting

Use blocks for emphasis:

```markdown
:::block
### Important Point
Key information here
:::
```

## Customization

### Colors

The template uses:
- **Background**: Beige (#E8E1D3)
- **Primary**: Stanford Cardinal (#8C1515)
- **Text**: Dark Gray (#2E2D29)

To modify colors, edit `inst/rmarkdown/templates/foodlab_presentation/resources/beamerthemeFoodLab.sty`

### Aspect Ratio

Change from 16:9 to 4:3 in YAML:

```yaml
classoption: "aspectratio=43"
```

### Logo Size

Adjust logo size in `preamble.tex`:

```latex
\\logo{\\includegraphics[height=0.8cm]{foodlab-logo.png}}
```

## Tips

1. **Keep slides simple**: 1 main point per slide
2. **Use visuals**: Plots speak louder than bullet points
3. **Consistent style**: The template handles formatting
4. **Practice**: Knit early and often to catch issues

## Contributing

Issues and pull requests welcome! Please follow Stanford and Food Lab branding guidelines.

## License

MIT License - free to use and modify for Food Lab presentations.

## Contact

Questions? Contact the Food Lab at Stanford University.

Website: https://www.foodlabstanford.com/
', file = "README.md")
cat("✓ Created: README.md\n")

# Print completion message
cat("\n✅ Package structure created successfully!\n\n")
cat("📍 Location:", pkg_dir, "\n\n")
cat("Next steps:\n")
cat("1. Add the Food Lab logo:\n")
cat("   - Save as: inst/rmarkdown/templates/foodlab_presentation/resources/foodlab-logo.png\n\n")
cat("2. Initialize git and push to GitHub:\n")
cat("   cd", pkg_dir, "\n")
cat("   git init\n")
cat("   git add .\n")
cat('   git commit -m "fixed: Food Lab presentation template"\n')
cat("   git remote add origin https://github.com/setgree/foodlabslides.git\n")
cat("   git push -u origin main\n\n")
cat("3. Test locally:\n")
cat("   devtools::install('", pkg_dir, "')\n\n", sep = "")
cat("4. After pushing to GitHub, lab members can install:\n")
cat("   devtools::install_github('setgree/foodlabslides')\n\n")