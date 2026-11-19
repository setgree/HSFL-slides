-- Used when foodlab_presentation(show_title_slide = FALSE): dropping the title
-- from the metadata stops pandoc from emitting the \titlepage frame.
function Meta(m)
  m.title = nil
  return m
end
