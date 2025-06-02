#import "@preview/minimal-presentation:0.2.0": *

//#set text(font: "Lato")
//#show math.equation: set text(font: "Lato Math")
//#show raw: set text(font: "Fira Code")

#show: project.with(
  title: "Minimalist presentation template",
  sub-title: "This is where your presentation begins",
  author: "Flavio Barisi",
  date: "10/08/2023",
  index-title: "Contents",
  // logo: image("./logo.svg"),
  // logo-light: [#emoji.abacus],
  logo: [#emoji.abacus],
  cover: image("./image_1.jpg")
)

= This is a section

== This is a slide title

#lorem(10)

- #lorem(10)
  - #lorem(10)
  - #lorem(10)
  - #lorem(10)

== One column image

#figure(
  image("image_1.jpg", height: 10.5cm),
  caption: [An image],
) <image_label>

== Two columns image

#columns-content()[
  #figure(
    image("image_1.jpg", width: 100%),
    caption: [An image],
  ) <image_label_1>
][
  #figure(
    image("image_1.jpg", width: 100%),
    caption: [An image],
  ) <image_label_2>
]

== Two columns

#columns-content()[
  - #lorem(10)
  - #lorem(10)
  - #lorem(10)
][
  #figure(
    image("image_1.jpg", width: 100%),
    caption: [An image],
  ) <image_label_3>
]

