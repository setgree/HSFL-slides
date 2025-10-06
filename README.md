# Food Lab Slides

R Markdown template for creating Beamer presentations with Humane & Sustainable Food Lab and Stanford University branding.

## Installation

Install directly from GitHub:

```r
# Install devtools if you haven't already
install.packages("devtools")

# Install foodlabslides
devtools::install_github("setgree/foodlabslides")
```

## Requirements

- R (>= 4.0)
- RStudio (recommended)
- LaTeX distribution (TinyTeX, MacTeX, or MiKTeX)
  - If you don't have LaTeX: `install.packages("tinytex"); tinytex::install_tinytex()`

## Setup

### Create a new presentation

In RStudio:
1. **File → New File → R Markdown...**
2. Click **"From Template"**
3. Select **"Food Lab Presentation"**
4. Choose a name and location
5. Click **OK**

### Customize your presentation

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
\logo{\includegraphics[height=0.8cm]{foodlab-logo.png}}
```

## Including Graphics

```r
knitr::include_graphics("path/to/image.png")
```

## Including Tables

```r
knitr::kable(your_data, booktabs = TRUE)
```

## Tips

1. **Keep slides simple**: 1 main point per slide
2. **Use visuals**: Plots speak louder than bullet points
3. **Consistent style**: The template handles formatting
4. **Practice**: Knit early and often to catch issues

## Troubleshooting

### LaTeX errors

If you get LaTeX compilation errors:
- Make sure `foodlab-logo.png` is in the correct directory
- Check that all required LaTeX packages are installed
- Try knitting a simple version first to isolate issues

### Logo not appearing

- Verify the logo file is named exactly `foodlab-logo.png`
- Make sure it's in the same directory as your .Rmd file
- Check the path in `preamble.tex`

### Font issues

The template uses Source Sans Pro and Source Serif Pro. These should be installed automatically with TinyTeX, but if you have issues:

```r
tinytex::tlmgr_install("sourcesanspro")
tinytex::tlmgr_install("sourceserifpro")
```


## License

MIT License - free to use and modify for Food Lab presentations.

## Contact

Questions? Contact the Food Lab at Stanford University.

Website: https://www.foodlabstanford.com/