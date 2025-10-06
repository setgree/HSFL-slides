# Food Lab Slides

R Markdown template for creating Beamer presentations with Humane & Sustainable Food Lab and Stanford University branding.

## Installation

Install directly from GitHub:

```r
# Install devtools if you haven't already
install.packages("devtools")

# Install foodlabslides
devtools::install_github("setgree/HSFL-slides")
```

## Requirements

- R (>= 4.0)
- RStudio (recommended)
- LaTeX distribution (TinyTeX, MacTeX, or MiKTeX)
  - If you don't have LaTeX: `install.packages("tinytex"); tinytex::install_tinytex()`

## Setup

### 1. Add the Food Lab logo

Download the Food Lab logo and save it as `foodlab-logo.png` in your R project directory (same folder as your .Rmd file).

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
