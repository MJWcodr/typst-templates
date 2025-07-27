#let titleFont = "Fira Mono"

#set rect(
  width: 100%,
  height: 100%,
  inset: 4pt,
)

#let title-slide(
  title:"",
  author: "",
  datum: "",
) = [

  #align(center+horizon)[
    #set text(
      font: titleFont,
      size: 36pt,
      weight: "black",
    )
    #title
    
    #set text(
      font: titleFont,
      size: 24pt,
      weight: "regular"

    )
    #if author != "" [
      Autor: #author \
    ]
    #if datum != "" [
      Datum: #datum \
    ]
  ]

  #pagebreak()
]

#let background-design = [
  #rect(
    width: 50%,
    height: 50%,
    fill: white,
    stroke: black,
  )
];

#let header(title-line) = [
 
  #set text(
    font: titleFont,
    size: 12pt,
    weight: "bold"
  )

  #align(left+top)[
    #title-line
  ]
];

#let template(
  doc, 
  author: ""
) = [
    #import "@preview/touying:0.6.1": *
    #import themes.simple: *
    #show: simple-theme.with(
      aspect-ratio: "16-9", 
      header: header(author), 
      footer: [Kek]
    )
  
    #set page(
      background: background-design
    )

    #set text(
      font: titleFont,
      size: 12pt,
      style: "italic"
    )

    #doc
]

