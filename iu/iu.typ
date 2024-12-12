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
  let font = "Fira Sans"
  let fontHeading = "Fira Sans"
  let fontHeadingWeight = "bold"
  let fontTitle = "Fira Sans Mono"
  let fontTitleWeight = "bold"
  let fontTitleSubtitle = "Fira Sans"
  let fontCode = "Fira Code"

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
    set text(font: font, weight: fontHeadingWeight, size: 12pt)
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
      font: fontTitleSubtitle, size: 12pt, fill: gray.darken(50%), 
      [#author -- #type_of_work]
    ),
  )
    // Title
  block(
    text(
      font: fontTitle, weight: fontTitleWeight, size: 24pt, fill: black, 
      [#subject]
    ),
  )
    // Subtitle
  block(
    inset: (top: 5em, left: 2em),
    text(
      font: fontTitleSubtitle, size: 12pt, fill: gray.darken(50%), 
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

  // outline(title: "Inhaltsverzeichnis \n ")
  heading(outlined: false, [Inhaltsverzeichnis])
  outline(title: none, indent: 3em)

  pagebreak()

  //
  // Main Body
  //
 
  set page(numbering: "1 / 1")
  counter(page).update(1)

  // set paragraph distance to 6pt

  // set line height to 1.5em and justify the text

  set par(
  leading: 1.5em,
  spacing: 2em,
  first-line-indent: 1em,
  justify: true,
  )

  //TODO: set line height in code blocks to 1.2em
  
  //TODO: set line height in tables to 1.2em

  body

  if (bibliography-file != none) {
    pagebreak()

    heading("Literaturverzeichnis")
    show bibliography: set text(10pt, font: font)
    bibliography(
      bibliography-file, title: none, style: bibliography-style,
    )
  }
}

