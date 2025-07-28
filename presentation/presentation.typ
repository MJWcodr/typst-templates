#let title-font = "Inter"
#let subtitle-font = "Fira Mono"
#let background-color = rgb("#F7F8F5")
#let dark-gray-text = rgb("#262626")
#let light-gray-text = rgb("#6E6E6E")
#let yellow-color = rgb("#F3C11B")

#let yellow-rectangle = [
  #pad(
    top: -40pt,
    bottom: -80pt
  )[
  #show rect: it => block(it)
  #rect(
    fill: yellow-color,
    width: 80pt,
    height: 15pt,
  )
]]

#let title-slide(
  title:"",
  author: "",
  datum: "",
  subtitle: "",
) = [
    #block(
      above: 100pt,
      inset: 0pt,
      width: 73%,
      [#yellow-rectangle \
      #set par(
        leading: 0.5em,
      )
      #set text(
        font: title-font,
        size: 48pt,
        weight: "bold",
        fill: dark-gray-text,
      )
      #title \
      #block(
        width: 90%,
      )[
      #if subtitle != "" [
        #pad(
          top: -20pt,
        text(
          font: subtitle-font,
          size: 18pt,
          weight: "regular",
          fill: light-gray-text,
        )[#subtitle]
      )]]
    ]
    )

    #set text(
      font: title-font,
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
  
#let background-design = [

  #place(dx: 60%, dy: -10%, image("./assets/background.svg", height: 120%)),

];

#let header(date) = [
  #set text(
    font: subtitle-font,
    size: 12pt,
  )

  #align(left+top)[
    #date
  ]
];

#let footer(title-line) = [
  #pad(
    top: -20pt,
  [
  #set text(
    font: subtitle-font,
    size: 12pt,
  )

  #align(left+top)[
    #title-line
  ]])
];

#let template(
  doc, 
  author: "",
  date: "",
) = [
    #import "@preview/touying:0.6.1": *
    #import themes.simple: *
    #show: simple-theme.with(
      aspect-ratio: "16-9", 
      header: header(date), 
      footer: footer(author),
    )

    // set date to current date if not provided
    #set page(
      fill: background-color,
      background: background-design,
    )
   
    #set text(
      font: title-font,
      size: 24pt,
      weight: "regular",
      fill: dark-gray-text,
    ) 

    #doc
]

