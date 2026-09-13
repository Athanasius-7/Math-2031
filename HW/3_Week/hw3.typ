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
        align(right)[Math 2031 --- Homework 3],
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
  "Homework 3",
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

= Section 5.2



#question("1C")[
  #given("Statement",[$1^3 + 2^3 + 3^3 + ... + n^3 = frac(n^2(n+1)^2, 4), n in NN$])
  = Proof by Induction:
  == Base Case: $k = 1, k in NN$
  LHS: $1^3 = 1$ \
  RHS: $frac(1^2(1+1)^2,4) = frac(4,4) = 1$ \
  Since LHS = RHS, the base case is true.
  == Induction Step:
  Assume $1^3 + 2^3 + 3^3 + ... + k^3 = frac(k^2(k+2)^2, 4)$ is true for $k$. \
  We want to show the statement is true also for $(k+1)$ by showing the LHS=RHS. \
  Substituting $(k+1)$ into the equation: \
  $1^3 + 2^3 + 3^3 + ... + k^3 + (k+1)^3= frac((k+1)^2(k+2)^2, 4)$ \
  Here we notice our IH: \
  $underbrace(1^3 + 2^3 + 3^3 + ... + k^3, "Inductive Hypothesis.") + (k+1)^3= frac((k+1)^2(k+2)^2, 4)$ \
  Replace: \
  $frac(k^2(k+1)^2, 4) + (k+1)^3 = frac((k+1)^2(k+2)^2, 4)$ \
  Factor $(k+1)^2$ from the LHS: \
  $(k+1)^2(frac(k^2,4) + k+1) = frac((k+1)^2(k+2)^2, 4)$ \
  Divide both sides by $(k+1)^2$, which is greater than $0$. \ 
  $frac(k^2,4) + k+1 = frac((k+2)^2, 4)$ \
  Expanding the LHS we get: \
  $frac(k^2,4) + k+1 = frac(k^2,4) + k + 1$ \
  --- \
  Thus $forall n in NN,1^3 + 2^3 + 3^3 + ... + n^3 = frac(n^2(n+1)^2, 4)$ \
  $qed$
]

#question("2A")[
  #given("Statement",[$1^2 + 3^2 + 5^2 + ... + (2n-1)^2 = frac((2n-1)(2n)(2n+1),6), n in NN$])
  = Proof by Induction:
  == Base Case: $k = 1, k in NN$
  LHS: $(2(1)-1)^2 = 1^2 = 1$ \
  RHS: $frac((2(1)-1)(2(1))(2(1)+1),6) = frac(1 dot 2 dot 3,6) = 6/6 = 1$ \ 
  Since LHS = RHS, the base case is true.
  == Induction Step:
  Assume $1^2 + 3^2 + 5^2 + ... + (2k-1)^2 = frac((2k-1)(2k)(2k+1),6)$ is true for $k$. \
  We want to show it is also true for $k+1$ by showing that the LHS=RHS. \
  Substituting $k+1$ into our equation: \
  $1^2 + 3^2 + 5^2 + ... + (2k-1)^2 + (2k+1)^2 = frac((2k+1)(2k+2)(2k+3),6)$ is true for $k$. \
  Note our IH: \
  $underbrace(1^2 + 3^2 + 5^2 + ... + (2k-1)^2, "Inductive Hypothesis.") + (2k+1)^2 = frac((2k+1)(2k+2)(2k+3),6)$. \
  Substitute: \
  $frac((2k-1)(2k)(2k+1),6) + (2k+1)^2 = frac((2k+1)(2k+2)(2k+3),6)$ \
  Factoring a $(2k+1)$ on both sides: \
  $(2k+1) dot (frac((2k-1)(2k),6) + (2k+1)) = (2k+1) dot frac((2k+2)(2k+3),6)$ \
  Canceling the $(2k+1)$, it is greater than $0$. \
  $frac((2k-1)(2k),6) + (2k+1) = frac((2k+2)(2k+3),6)$ \ 
  Expanding both sides: \
  $frac(4k^2 + 10k + 6, 6) = frac(4k^2 + 10k + 6, 6)$ \
  --- \
  Thus $forall n in NN, 1^2 + 3^2 + 5^2 + ... + (2n-1)^2 = frac((2n-1)(2n)(2n+1),6)$ \
  $qed$
]

#question("3")[
  #given("Statement", [For any real number $a$ except 1, $1 + a + a^2 + a^3 + ... + a^(n) = frac((a^(n+1)-1),a-1)$])
]
