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
  == Case 2: Even: $n = 2k_2$
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
  = Proof by Contradiction:
  Let $n in ZZ$. \
  We want to show that $4 divides.not n^2 + 2, forall n in ZZ$. \
  By contradiction, suppose not. Suppose $4|n^2 + 2$. \
  Thus, $n^2 + 2 = 4k_1, k_1 in ZZ$. \
  Simplifying further: \
  $n^2 = 4k_1 - 2$. 
  == Case 1: $n$ is even.
  Assume $n$ is even. Thus $n = 2c, c in ZZ$. \
  Thus: \
  $(2c)^2 = 4k_1 - 2$. \
  Expanding: \
  $4c^2 = 4k_1 - 2$. \
  Factor a $2$: \
  $2(2c^2) = 2(2k_1 -1)$. \
  Cancel the $2$: \
  $2c^2 = 2k_1 -1$. \
  By Theorem 1.4.4, we know any even integer squared is also even, however here we $2c$, an even integer by assumption, equal to an odd integer, thus in this case we have encountered a contradiction.
  == Case 2: $n$ is odd.
  Assume $n$ is odd. Thus $n = 2d + 1, d in ZZ$. \
  Thus by substitution: \
  $(2d+1)^2 = 4k_2 -2$ \
  $4d^2 + 4d + 1 = 4k_2 -2$ \
  Rearranging: \
  $4d^2 +4d = 4k_2 - 2 -1$
  Factoring a $2$: \
  $2(underbrace(d^2 + 2d, "Integer")) = 2(underbrace(k_2 -1, "Integer")) - 1$ \
  Here we encounter yet another contradition, as the LHS by definition is even and the LHS is odd, thus we have encountered a contradition. \
  Therefore, since the negation of the original statement is false, the original statement must be true. \
  If $n in ZZ$, then $n^2 + 2$ is not divisible by $4$ for for every integer n. \
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
#question("10")[
  #parts(
  [$a = 1840, b = 1518$ \
   $gcd(a,b)=46$ \
   $1840 = 1518(1) + 322$ \
   $1518 = 322(4) + 230$ \
   $322 = 230(1) + 92$ \
   $230 = 92(2) + 46$ \
   $92 = 46(2) + 0$  \
   _Linear Combination_: \
   $46 = 1518(17) - 1840(14)$
 ],
  [$a = 1001, b = 3465$ \
   $gcd(a,b)=77$ \
   $1001 = 3465(0) + 1001$ \
   $3465 = 1001(3) + 462$ \
   $1001 = 462(2) + 77$ \
   $462 = 77(6) + 0$ \
   _Linear Combination_: \ 
   $77 = 7(1001) - 2(3465)$
 ])
]
#question("12")[
  #given("Statement", [Let $a,b,c in ZZ$. Suppose that $gcd(a,c)=gcd(b,c)=1$. Prove that $gcd(a b,c)=1$])
  = Proof:
  Let $a,b,c in ZZ$ and assume $gcd(a,c)=gcd(b,c)=1$. \
  We want to show that $gcd(a b,c) = 1$. \
  By assumption, since $gcd(a,c) = 1$ and $gcd(b,c) = 1$ it must follow by Bezout's Identity: \
  $a x + y c = 1$ and $b v + c d = 1$ where $d,v,x,y in ZZ$ \
  Multiplying $1$ by $1$ from both sides we get: \
  $(a x + y c)(b v + c d) = 1$ \
  Expand: \
  $a x b v + a x c d + y c b v + y c^2 d = 1$ \
  Factor out $a b$ and $c$ from the LHS: \
  $a b (underbrace(x v, "Integer")) + c (underbrace(a x d + y b v + y c d, "Integer")) = 1$ \
  $therefore$ by the converse of Bezout's Identity $gcd(a b,c) = 1$ which is what we wanted to show. \
  $qed$
]
#question("13")[
  #given("Statement", [Let $a,b,c in ZZ$. Suppose that $a|c$ and $b|c$ and that $gcd(a,b)=1$. Prove that $a b|c$.])
  = Proof:
  Assume $a,b,c in ZZ$ such that $a|c and b|c and gcd(a,b)=1$. \
  We want to show that $a b|c$. \
  Our assumptions give us that $c = a(k_1), c = b(k_2)$ and $a x + b y = 1$ for some integers $k_1, k_2, x, y$. \
  Given: \
  $1 = a x + b y$ \
  Multiply both sides by $c$: \
  $c = c a x + c b y$ \
  By assumption $c = a k_1 = b k_2$: \
  $c = a b x k_2 + a b y k_1$ \
  Factoring $a b$: \
  $c = a b(x k_2 + y k_1)$ \
  $therefore a b|c$. \
  $qed$
]

= Additional Problems


#question("1")[
  #given("Statement", [Let $a, b,c$ be integers. Prove that there exists integers $r$ and $s$ for which $c = a r + b s$ if and 
only if $gcd(a,b)|c$.])
= Proof:
== Part 1: $c = a r + b s arrow.r gcd(a,b)|c$
Let $a, b,c$ be integers such that $c = a r + b s$. \
Let $d = gcd(a,b)$. We want to show that $d|c$. \
By defintion $a = d k_1$ and $b =  d k_2$ for some integers $k_1, k_2$. \
We can rewrite our assumption as: \
$c = d k_1 r + d k_2 s$ \
Factoring out $d$: \
$c = d (underbrace(k_1 r +k_2 s, "Integer"))$ \
$therefore d|c$.
== Part 2: $gcd(a,b)|c arrow.r c = a r + b s$
Let $a, b,c$ be integers such that $gcd(a,b)=d$ and $d|c$. \
We want to show that $c = a r + b s$. \
By definition and Bezout's Identity: \
$c = d k$,$d = a x + b y$\
Thus we can express $c$ as: \
$c = k(a x + b y) = a (k x) + b (k y)$ \
Letting $r = k x$ and $s = k y$ we have: \
$c = a r + b s$. \
$qed$


]
#question("2")[
  #given("Statement", [Let $a, b,c$ and $d$ be integers. Prove that if $gcd(a,b)=1, d|a c$ and $d |b c$, then $d|c$.])
= Proof:
Let $a,b,c,d in ZZ$ such that $gcd(a,b) = 1, d|a c and d| b c$. \
We want to show that $d|c$. \
By definition: $a x + b y = 1$, $a c = d(k_1)$, and $b c = d(k_2)$ for some $x, y, k_1, k_2 in ZZ$. \
Take $a x + b y = 1$ and multiply by $c$: \
$c a x + c b y = c$ \
We know that $a c = c a = d(k_1)$ and $c b = b c = d(k_2)$, thus we can substitute: \ 
$d k_1 x + d k_2 y = c$ \
Factoring $d$: \
$d (underbrace(k_1 x + k_2 y, "Integer")) = c$ \
$therefore d|c$. \
$qed$
]
