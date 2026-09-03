#set page(
  paper: "us-letter",
  margin: (x: 1in, y: 1in),
  numbering: "1",
  number-align: center,
  header: context {
    if counter(page).get().first() > 1 [
      #set text(size: 9pt, fill: rgb("#666666"))
      #grid(
        columns: (1fr, 1fr),
        align(left)[Imran Qasimi],
        align(right)[Math 2031 --- Homework 2],
      )
      #line(length: 100%, stroke: 0.4pt + rgb("#cccccc"))
    ]
  },
)

#set text(font: "New Computer Modern", size: 11pt)
#set par(justify: true, leading: 0.65em)
#set heading(numbering: none)
#set enum(indent: 1em)
#set list(indent: 1em)

// ------------------------------------------------------------
//  Reusable components
// ------------------------------------------------------------

// Title block for the first page
#let title-block(name, course, professor, assignment, date: none) = {
  align(center)[
    #text(size: 18pt, weight: "bold")[#assignment]
    #v(0.35em)
    #text(size: 12pt, fill: rgb("#444444"))[#course --- #professor]
  ]
  v(0.6em)
  line(length: 100%, stroke: 0.7pt)
  v(0.3em)
  grid(
    columns: (1fr, 1fr),
    align(left)[*Name:* #name],
    align(right)[*Date:* #date],
  )
  v(0.3em)
  line(length: 100%, stroke: 0.7pt)
  v(1.2em)
}

// A labeled, numbered question section
#let question(number, body) = block(above: 1.6em, below: 1em)[
  #block(
    width: 100%,
    fill: rgb("#f2f2f2"),
    inset: (x: 0.6em, y: 0.45em),
    radius: 3pt,
  )[#text(weight: "bold", size: 12.5pt)[Question #number]]
  #v(0.6em)
  #body
]

// Lettered sub-parts, e.g. (A), (B), (C), ...
#let parts(..items) = enum(
  numbering: "(A)",
  spacing: 0.65em,
  ..items.pos(),
)

// A boxed premise / given statement, e.g. for proof-analysis questions
#let given(label, statement) = block(
  width: 100%,
  fill: rgb("#f7f7f7"),
  stroke: 0.5pt + rgb("#cccccc"),
  inset: 0.7em,
  radius: 3pt,
)[*#label:* #statement]

// ------------------------------------------------------------
//  Title
// ------------------------------------------------------------

#title-block(
  "Imran Qasimi",
  "Math 2031",
  "Professor Hamilton",
  "Homework 2",
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

= Section 2.1



#question("21")[
  #given("Statement", [Let $A$ and $B$ be sets contained in universal set $U$. Which one(s) of the followig statements are equivalent to the statement $A subset.eq B?$ Give reasons for your answers. ])
  #v(0.6em)
  #parts(
    [$forall x in U, x in A and x in B.$ True by definition of being a subset.],
    [$forall x in U, x in.not B arrow.r x in.not A.$ True, since $A$ is a subset of $B$, if an element does not exist within $B$ then we must conclude that it does not also exist within $A$.],
    [$exists x in U | x in A and x in B.$ True by definition, since $A$ is a subset of $B$, $x in A$ and $x in B$ are both true by definition, making the broader statement true as well.],
    [$forall x in U, x in A arrow.r x in B.$ True by definition, since $A$ is a subset of $B$, if $x in A$ it must follow $x in B$ by definition.],
    [$forall x in U, x in.not A arrow.r x in.not B.$ False, let $A={1,2,3}$ and $B=ZZ$. $4 in B and 4 in.not A$ even though $A subset.eq B$.],
  )
]

= Section 2.2

#question("1")[
  #given("Given", [Let $A = {1,2,3,4,5}, B = {0,1,4,8}$ and $ C = {2, 5, 7, 9, 11, 13, 17}$. Compute each of the following:])
  #parts(
    [$A union B = {0,1,2,3,4,5,8}$],
    [$A inter B = {1,4}$],
    [$A inter C = {2,5}$],
    [$A - B = {2,3,5}$],
    [$A - (B union C) = {3}$],
    [$(A - B) union (A-C) = {1,2,3,4,5}$],
    [$A inter (B union C) = {1,2,4,5}$],
    [$(A inter B) union (A inter C)={1,2,4,5}$],
    [$A union (B inter C) = {1,2,3,4,5}$],
    [$(A union B) inter (A union C)={1,2,3,4,5}$],
  )
]

#question("2")[
  #given("Given", [Let $A, B$ and $C$ be the sets given in the previous exercise and let the universal set $U={0,1,2,3,4,...,20}$. Compute the following:])
Note: Here '...' means sequential integers from $a$ to $b$.

  #parts(
    [$overline(A)={0,6,7,8,...,20}$],
    [$overline(B)={0,2,3,5,6,7,9,...,20}$],
    [$overline(A inter B)={0,2,3,5,...,20}$],
    [$overline(A) union overline(B)={0,2,3,5,6,7,...,20}$],
    [$overline(A union B)={6,7,9,..,20}$],
    [$overline(A) inter overline(B)={0,6,7,10,...,20}$],
  )
]

