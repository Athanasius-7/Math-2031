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
#question("14B")[
  #given("Statement", [Let $A$ and $B$ be sets. Prove the following: $A union (A inter B) = A$])
  = Proof:
  Let $A$ and $B$ be sets and assume $x in A union(A inter B)$. We must show that: \
  I.) $A union (A inter B) subset.eq  A$ and II.) $(A subset.eq A union (A inter B))$ \
  === Part I: \
  Let $x in A union (A inter B)$. We must show that $x in A$ for the definition of a subset.
  Since $x in A union (A inter B)$ by assumption, $x in A or (x in A and x in B)$, which
  necessitates that $x in A$ in both cases, thus we have shown $forall x in A union (A inter B), x in A$.
  === Part II: \
  Let $x in A$. We must also show that $x in A union (A inter B)$ for the definition of a subset.
  By assumption $x in A$ and as per Part I, $x in  A union (A inter B)$ necessitates that $x in A therefore$
  $forall x in A, x in A union (A inter B)$. \
  Thus $A union (A inter B) = A$. $qed$
]
#question("17")[
  #given("Statement", [Let A, B, and C bet sets.])
  #parts(
  [  #given("Conjecture", [$ A subset.eq B union C arrow.r A subset.eq B or A subset.eq C$])
  = Proof:
  Let $A,B,C$ be sets such that $A subset.eq B union C$. \
  We want to show that $A subset.eq B or A subset.eq C$, i.e, $forall x in A, x in B or x in C$, 
  by the definition of subset and union. \
  By assumption since $A subset.eq B union C$, it follows that $forall x in A, x in B or in C$, as per the definition of union. \
  === Case 1: $ x in B$
  If we assume $x in B$ by the definition of union, and since $x in A$ by our initial assumption, it must follow that 
  $A subset.eq B$ which would satisfy one of the conditions of our conclusion, which is what we wanted to demonstrate.
  === Case 2: $ x in C$
  Similar behavior to the case above. \
  Therefore, we have shown that $A subset.eq B union C arrow.r A subset.eq B or A subset.eq C$. $qed$
],
[$A subset.eq.not B and A subset.eq.not C arrow.r A subset.eq.not $]
  )
]
