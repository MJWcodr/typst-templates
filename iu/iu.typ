#let template(doc) = [
  // variables
  subject: "IU Course", // The type of the document (e.g. "Assignment", "Advanced Workbook", "Exam")
  type_of_work: "Assignment",
  course_of_study: none, // The name of the course (e.g. "Einführung in das wissenschaftliche Arbeiten für IT und Technik")
  author: none,
  student_number: none,
  tutor: none,
  date: datetime.today(),


  // page settings
  #set page(
  paper: "a4",
  margin: (x: 2cm, y: 2cm),
  )
 
  #set text(
    font: "Arial",
    size: 11pt, 
    line_height: 1.5,
  )

  #set heading(
    font: "Cairo",
    size: 12pt, 
    line_height: 1.5,
  )
  body
] = {

  // set document metadata
  set document(title: title+author, author: author)

  // bibliography
  if (bibliography-file != none) {
    show bibliography: set text(10pt, font: "Arial")
    bibliography(bibliography-file, title: text(10pt, "References"), style: bibliography-style)
  }
}
