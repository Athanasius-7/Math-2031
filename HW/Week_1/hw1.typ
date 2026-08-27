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
        align(right)[Math 2031 --- Homework 1],
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
  "Homework 1",
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

= Section 1.1

#question("4")[
  #parts(
    [$exists$ triangle $T$ such that $T$ is not an isosceles triangle.],
    [$forall$ even numbers $N$, there does not exist an $A in RR$ such that $N = 3A$.],
    [There exists a door in the building that was not locked.],
    [There exists a new car such that there is nothing wrong with it.],
    [All angles of a triangle are less than or equal to $90$ degrees.],
    [$forall$ sets $S$, $S$ does not contain infinitely many elements.],
  )
]

#question("5")[
  #parts(
    [$forall x in RR$, $x^2 + x + 1 != 0$.],
    [$exists x in RR$ such that $x >= 100$.],
    [$f$ is a polynomial function and $f$ is not continuous at $0$.],
    [$f$ is a polynomial function and $f$ is not continuous anywhere.],
    [$exists x in RR$ such that $forall y in RR$, $y != x^3$.],
    [$forall$ real-valued functions $f(x)$, $f(x)$ is continuous at any real number $x$.],
  )
]

#question("7")[
  #given("Conjecture", [The sum of two even integers is divisible by 4.])
  #v(0.6em)
  #parts(
    [For all integers $x, y$, if $x$ and $y$ are even then $x + y$ is divisible by $4$.],
    [$x, y$ are even integers and $x + y$ is not divisible by $4$.],
    [
      Let $x = 2$ and $y = 0$. In this case $x + y = 2 + 0 = 2$, which is not divisible by
      $4$. Therefore the conjecture is false; the statement would only be true for even
      integers $x, y$ that are greater than or equal to $2$.
    ],
  )
]

= Section 1.2

#question("5")[
  #parts(
    [$x$ and $y$ are real numbers such that $x y=0$ and $x != 0$ and $y != 0$.],
    [$exists x in ZZ$, $x^2$ is not odd or $x^3 - 1$ is not divisible by $4$.],
    [$exists n in ZZ$ such that $forall k in ZZ$, $n != 2k and n != 2k + 1$.],
    [$forall r in RR$, $r<=1 and r>=2$.],
    [$forall r in RR$, $r$ is less than or equal to 2 and less than or equal to 1.],
    [All functions are differentiable at 0 and continuous at 0.]
  )
]

#question("6")[
  #given("Conjecture", [Every multiple of 6 is even and is not a multiple of 4.])
  #v(0.6em)
  #parts(
    [$forall n=6a | n = 2k and n != 4b$. ${n, a, k, b in NN}$.],
    [$exists n= 6a | n != 2k or n = 4b$. ${n, a, k, b in NN}$],
    [Let's assume that $n=6a | n,a in NN$, i.e, $n$ is an integer multiple of 6. Our goal is to establish that every $n in NN$ is 
  divisible by $2$, ergo even, and not every $n$ is a multiple of $4$, i.e, $n != 4b$,$b in NN$. Let us rewrite $n$ by factoring a 2, in which case we get $n=2(3a)$. Here $3a$ is an integer and thus we have expressed $n$ as integer multiple of $2$, $therefore$ by definition it is even. Next, we want to prove that not every $n$ is a multiple of $4$, which here we will prove by contradiction. Let $n$ be a multiple of 6 and 4. Thus $6a=4b$, remember $a$ and $b$ are both integers, however if we divide the RHS by 4 or the LHS by 6, we get following fractions; $a= 4/6b$ or $b=6/4b$ which contradicts the operations of the integers, in that they are closed under multiplication. Since the negation leads to contradtion, the original statement must be true. *QED*],
  )
]
= Section 1.3

#question("1")[
  #parts(
    [P : $forall$ Hexagons $H$, $H$ has $6$ sides. \ $~P$ : $exists H$ | $H$ does not have $6$ sides.],
    [P : $forall n,a,b in NN$ $n = 2a or n = 2b + 1 $ . \ $~P$ : $exists n,a,b in NN$ | $n != 2a and n != 2b + 1$.],
    [P : $forall f$ that is differentiable at 0, $f$ is continuous at 0. \ $~P$ : $exists f$ that is differentiable at 0 such that $f$ is not continuous at 0.],
    [P : $forall x in RR$, $exists y in RR$ such that $sqrt(x) = y$. \ $~P$ : $exists x in RR$ such that $forall y in RR$, $sqrt(x) != y$]
  )
]
