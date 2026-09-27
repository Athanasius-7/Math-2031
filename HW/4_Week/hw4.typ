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
        align(left)[Imran Qasimi], align(right)[Math 2031 --- Homework 4],
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
    align(left)[*Name:* #name], align(right)[*Date:* #date],
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
  "Homework 4",
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

= Section 5.3



#question("2")[
  #given(
    "Statement",
    [Prove that $n^2 - n$ is divisible by $2$ for every integer $n$.],
  )
  = Proof:
  Let $n in ZZ$. We want to show that $forall n in ZZ, 2|n^2 - n$. \
  There are two possible cases. \
  _A)_ $n$ is odd, i.e, $n = 2k_1 + 1$ \
  _B)_ $n$ is even, i.e, $n = 2k_2$ \
  == Case 1: Odd: $n = 2k_1 + 1$
  Let $n$ be an odd integer, thus $n=2k_1 + 1$ for some integer $k_1$. \
  We want to show that $2|n^2-n$. \
  By assumption since $n$ is odd we can rewrite our expression as: \
  $(2k_1 +1)^2 - (2k_1 + 1)$ \
  Which expands to: \
  $4(k_1)^2 + 4k_1 + 1 - 2k_1 - 1$ \ 
  Simplifying: \
  $4(k_1)^2 + 2k_1$ \ 
  Factoring out a $2$: \
  $2(2(k_1)^2 + k_1)$ \
  Thus if $n$ is odd, $2|n^2 - n$.
  == Case 1: Even: $n = 2k_2$
  Let $n$ be an even integer, thus $n = 2k_2$ for some integer $k_2$. \
  We want to show that $2|n^2-n$. \
  By assumption $n=2k_2$ thus we can rewrite our expression as: \
  $(2k_2)^2 - (2k_2)$ \
  Which expands to: \
  $4(k_2)^2 - 2k_2$ \
  Factoring out a $2$: \ 
  $2(2(k_2)^2 - k_2)$ \
  $therefore forall n in ZZ, 2|n^2-n$. \
  $qed$
]

#question("3")[
  #given("Statement", [Prove that if $n in ZZ$, then $n^2 + 2$ is not divisible by $4$ for for every integer n.])
  == Proof by Contradiction:
  Suppose not. Suppose the negation: $n in ZZ and 4|n^2 +2$. However, $4 divides.not n^2 + 2$ for $n = 1$: \
  $1^2 + 2 = 3$ \
  $4 divides.not 3$ \
  Therefore since the negation is false, it must mean the original statement must be true. \
  $qed$
]

#question("6c")[
  #given("Statement", [If $a|b$ and $b|c$, then $a|c$.])
  Let $a, b, c in NN$ such that $b = a(k_1)$ and $c = b(k_2)$. \
  We want to show that $a|c$, i.e, $c$ is an integer multiple of $a$. \
  By assumption since $b=a(k_1)$ we can rewrite $c$ as: \
  $c = a(k_1)(k_2)$ \
  Thus we have shown $a|c$. \
  $qed$

]
