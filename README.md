# Food Lab Slides

R Markdown template for creating Beamer presentations with Humane & Sustainable Food Lab and Stanford University branding.

There's also a sample presentation for the October 2025 Reducetarian summit.
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

## License

MIT License - free to use and modify for Food Lab presentations.

