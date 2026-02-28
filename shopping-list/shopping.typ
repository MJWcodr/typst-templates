#let spacer = text(fill: gray)[#h(8pt) | #h(8pt)]
#let tag(body) = {
    set text(black)
    let tag_color = black
    if body == "vegetables" {
      tag_color = rgb("#1d9153")
    } else if body == "fruits" {
      tag_color = rgb("#faa1b1")
    } else if body == "asian" {
      tag_color = rgb("#e88d92")
    } else if body == "spices" {
      tag_color = rgb("#cfbc40")
    } else if body == "herbs" {
      tag_color = rgb("#ddf4d7")
    } else if body == "dairy" {
      tag_color = rgb("#b3e2fa")
    } else if body == "grains" {
      tag_color = rgb("#d8dbb4")
    } else if body == "vegetarian" {
      tag_color = rgb("#e99ea5")
    } else if body == "cleaning" {
      tag_color = rgb("#9dbbbf")
    } else if body == "cats" {
      tag_color = rgb("#f2b6c0")
    }
  spacer
  highlight(fill: tag_color, radius: 25%, extent: 5pt, [
    // some space before the tag
    #text(fill: black)[#body]
  ])
}

#let template(doc) = [
  #metadata("Title: Shopping List")

  #set page(
    paper: "a6",
  )

  #set text(
    font: "Fira Mono",
    size: 12pt,
    fill: black.lighten(20%),
  )

  #set list(marker: square(height: 0.75em))

  
#let grid_list(..items) = {
  grid(
    columns: 20,
    fill: none,
    inset: 5pt,
    ..items
  )
}

#align(center)[
  #text(size: 16pt, weight: "black")[Shopping List]

]
  #doc
]
