#let template(
  // Assignment Metadata
  author: none,
  course_of_study: none,
  student_number: none,
  type_of_work: none,
  subject: none,
  subject_id: none,
  tutor: none,
  // 
  bibliography-file: none, 
  bibliography-style: "apa", 
  date: datetime.today(),
  lang: "de",
  venue: "IU Internationale Hochschule", 
  body,
) = {
  // Variables used within the document
  let spacer = text(fill: gray)[#h(8pt) | #h(8pt)]
  let font = "Aerial"
  let fontHeading = "Aerial Bold"

  //
  // Functions
  //
  let generatePageCounter = page => {
    let pageNumber = counter(page).display()
      return "Seite " + (pageNumber) + " von " + locate((loc) => {
        return counter(page).final(loc).first()
      })
  }

  //
  // Document Metadata
  //
  set document(
    title: subject+type_of_work, 
    author: author, 
    date: date, 
  )

  //
  // Document Settings
  //
  set page(
    paper: "a4",
    margin: (x: 2cm, y: 2cm), 
    header: locate(loc => {
      if (loc.page() == 1) {
        return block(
          width: 100%, stroke: (bottom: 1pt + gray), inset: (bottom: 8pt, left: 2pt), [],
        )
      } else {
        return block(
          width: 100%, stroke: (bottom: 1pt + gray), inset: (bottom: 8pt, left: 2pt), [
            #grid(
              columns: (75%, 25%), align(
                left, text(
                  size: 8pt, fill: gray.darken(50%), (
                      [*#type_of_work*],
                      [#subject],
                    ).filter(t => t != none).join(spacer),
                ),
              ), align(
                right,
              )[
                #text(
                  size: 9pt, fill: gray.darken(50%),
                )[
                  #author
                ]
              ],
            )
          ],
        )
      }
    }),
    // footer contains the page number and the date
    footer: block(
      width: 100%, stroke: (top: 1pt + gray), inset: (top: 8pt, right: 2pt), align(center, text(8pt,
        generatePageCounter(page)
      ))
    ),
  )

  //
  // Main Body
  //

  set text(
    font: font,
    lang: "de",
    size: 11pt
  )
  
  show heading: it => {
    set text(font: font, size: 12pt)
    [
      #it.body
    ]
  }

  //
  // Title Page
  //

  set page(numbering: "(i)")
    // Surtitle
  block(
    text(
      font: fontHeading, size: 12pt, fill: gray.darken(50%), 
      [#author -- #type_of_work]
    ),
  )
    // Title
  block(
    text(
      font: fontHeading, size: 24pt, fill: black, 
      [#subject]
    ),
  )
    // Subtitle
  block(
    inset: (top: 5em, left: 2em),
    text(
      font: fontHeading, size: 12pt, fill: gray.darken(50%), 
      [
        Student: #author \
        Matrikelnummer: #student_number \
        Kurs: #course_of_study \
        Kurs ID: #subject_id \
        Tutor: #tutor \
      ]
    ),
  )
    // Author

  pagebreak()

  //
  // Table of Contents
  //
  
  par(leading: 1.5em, (
    outline(title: "Inhaltsverzeichnis \n ")
  ))

  pagebreak()

  //
  // Main Body
  //
 
  set page(numbering: "1 / 1")
  counter(page).update(1)

  // set paragraph distance to 6pt
  show par: set block(spacing: 2em)

  // set line height to 1.5em and justify the text
  set par(leading: 1.5em, justify: true)

  body

  if (bibliography-file != none) {
    show bibliography: set text(10pt, font: font)
    bibliography(
      bibliography-file, title: text(10pt, "References"), style: bibliography-style,
    )
  }
}

