#let preamble(title: "[Title]", description: none, body) = {
  import "imports/boxes.typ": *
  import "imports/text.typ": *
  import "@preview/hydra:0.6.2": hydra
  import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node

  import "imports/template.typ": apply-format, hor-rule, big-rule, main-color, math-color, code-color
  show: apply-format.with(
    name: title,
    description: description,
  )

  heading(numbering: none, outlined: false)[
    Contents
  ]
  columns(2)[
    #outline(title: none) // title needs to be none, otherwise it will also be compressed into the column
  ]
  pagebreak()

  // Set header
  set page(
    header: context {
      let starts-l1 = query(heading.where(level: 1).after(here()))
      if starts-l1.len() > 0 and starts-l1.first().location().page() == here().page() {
        return
      }
      
      columns(2, gutter: 0pt)[
        #align(left)[#emph(hydra(1))]
        #colbreak()
        #align(right)[#emph(hydra(2))]
      ]
      hor-rule(stroke: 1pt)
    },
  )

  // Set footer
  set page(footer: context{
    align(right)[
      #counter(page).display(
        "1|1",
        both: true
      )
    ]
  })
  // Reset page numbering
  counter(page).update(1)

  body
}
