#import "iu.typ" : template

#show: template.with(
  author: "John Doe",
  course_of_study: "Computer Science",
  lang: "de", 
  student_number: "1234567",
  subject_id: "CS101",
  tutor: "Dr. Jane Doe",
  subject: "Introduction to Computer Science",
  type_of_work: "Advanced Workbook",
  bibliography-file: "example.bib",
  use_iu_required_fonts: false,
)

= Introduction

#lorem(100)

= Chapter 1: Basics

#lorem(20)

== Chapter 1a: Fundamentals

The important works of @smith2023quantum, @brown2022ml, @zhang2024neural, @tech2023report and @garcia2023analysis are discussed in this chapter.

#lorem(100)

== Chapter 1b: Basics

#lorem(100)

= Chapter 2: Advanced

#lorem(50)

== Chapter 2a: Profound

#lorem(100)

=== Chapter 2a.1: Deep

#lorem(100)

*Some Code:*

```python

def hello_world():
  print("Hello World")

hello_world()


```


= Chapter 3: Cool Table

#lorem(10)

#table(
  columns: (auto, auto, auto),
  align: (left, center, right),
  [Hello], [Skibidi], [lol],
  lorem(3), lorem(50), lorem(30) 
)

#lorem(10)

#table(
  columns: (auto, auto, auto),
  align: (left, center, right),
  lorem(1), [Skibidi], lorem(1),
  lorem(3), lorem(5), lorem(10),
  lorem(3), lorem(5), lorem(10),
  lorem(3), lorem(5), lorem(10),
  lorem(3), lorem(5), lorem(10),
  lorem(3), lorem(5), lorem(10),
  lorem(3), lorem(5), lorem(10)
)



= Chapter 4: Conclusion

#lorem(100)

= Bibliography

#strong("Work in Progress")

#lorem(10)






