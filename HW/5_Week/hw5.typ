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
        align(left)[Imran Qasimi], align(right)[Math 2031 --- Homework 5],
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
  "Homework 5",
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

= Section 5.4



#question("2")[
  #given(
    "Statement",
    [Let $n in ZZ, n >1$. Prove that if $n$ is not divisible by any prime number less than or equal to $sqrt(n)$, then $n$ is a prime number.],
  )
  = Proof by Contradiction:
  Suppose not. \
  Suppose an integer $n>1$ is not divisible by any prime number less than or equal to $sqrt(n)$ and $n$ is not a prime number, ergo composite. \
  By definition, since $n$ is composite, $n = y k_1$ for some intgers $y, k_1$. \
  Moreover: $1 < y <= k_1 < n$. \
  By assumption, since $n$ is not divisible by any prime less than or equal to $sqrt(n)$ then: \
  $y > sqrt(n) and k > sqrt(n)$: \
  However, this would lead to: \
  $y dot k_1 > sqrt(n) dot sqrt(n) > n$ \
  Which is a contradiction since we assumed $y dot k_1 = n$ and therefore the smaller factor, $y$ must be less than or equal to $sqrt(n)$. \
  $therefore$ since the negation leads to contradiction, the original statement must be true. \
  If $n$ is not divisible by any prime number less than or equal to $sqrt(n)$, then $n$ is a prime number. \
  $qed$
]

#question("6a")[
  #given(
    "Statement",
    [Prove that $sqrt(3)$ is irrational.])
    = Proof by Contradiction:
    Suppose not. Suppose that $sqrt(3)$ is rational. \
    Therefore by definition, $sqrt(3) = frac(a,b)$ for some integers $a,b$ where $b>0$. \
    Assume also that $frac(a,b)$ are in their simplified form, meaning $gcd(a,b) = 1$. \
    Squaring both sides we get: \
    $3 = (frac(a,b))^2 = frac(a^2,b^2)$ \
    This allows us to express $a^2$ as: \
    $a^2 = 3b^2$ \
    Thus we get that $3|a^2 arrow.r 3|a dot a$ and by Euclid's lemma $arrow.r 3|a$. \
    Therefore we get: \
    $a = 3k$ for some integer $k$.
    Going back and substituting to our expression above:
    $(3k)^2 = 3b^2$ \
    Simplifying: \
    $9k^2 = 3b^2$ \
    Thus: \
    $b^2 = 3k^2$ \
    And again as per the previous steps, we get $3|b$. \
    Therefore since, $3|a$ and $3|b$ we get that $gcd(a,b) >= 3$. \
    However, by our original assumption, $gcd(a,b) = 1$ and $ 1 >= 3$ is a contradiction. \
    Therefore, since the negation leads to a contradiction, it must follow that the original statement is true. \ 
    $sqrt(3)$ is irrational. \
    $qed$
]
#question("9")[
  #given(
    "Statement",[Let $n in ZZ, n >= 1$. Prove that $n$ is a perfect square if and only if, when $n$ is written in standard form, all of the exponents are even.])
    = Proof: 
    == Part 1: $n$ is a perfect square $arrow.r n$'s standard form exponents are all even.
    Let $n in ZZ, n >= 1$ such that $n$ is a perfect square thus $n = k^2$ for some integer $k$. \
    We want to show when n is written in standard form, all of the exponents are even. \
    Writing $m$ in standard form we get: \
    $k = p_(1)^(m_1) dot p_(2)^(m_2) dot ... dot p_(r)^(m_r)$ \
    We know $n = k^2$ therefore: \
    $n = k^2 = (p_(1)^(m_1) dot p_(2)^(m_2) dot ... dot p_(r)^(m_r))^2$ \
    Applying the power rule for exponents: \
    $n = k^2 = p_(1)^(2m_1) dot p_(2)^(2m_2) dot ... dot p_(r)^(2m_r)$ \
    Therefore, since $2|2m_i$ for all $1<=i<=r$ thus by definition all the exponents are even.
    == Part 2: Standard form exponents of $n$ are all even $arrow.r$ n is a perfect square.
    Let $n in ZZ, n >= 1$ such that all the standard form exponents of $n$ are even. \
    We want to show thus that $n$ is a perfect square. \
    Writing out $n$ in standard form including our assumption: \
    $n = p_(1)^(2m_1) dot p_(2)^(2m_2) dot ... dot p_(r)^(2m_r)$ \
    Let $k^2 = n$. \
    Thus: \
    $k^2 = p_(1)^(2m_1) dot p_(2)^(2m_2) dot ... dot p_(r)^(2m_r)$ \
    Taking the square root of both sides: \
    $k = (p_(1)^(2m_1) dot p_(2)^(2m_2) dot ... dot p_(r)^(2m_r))^(1/2)$ \
    Applying the power of exponents once more: \
    $k = p_(1)^(m_1) dot p_(2)^(m_2) dot ... dot p_(r)^(m_r)$ \
    Note here that $k$ is still an integer, since integers are closed through multiplication, moreover, $forall p_i, m_i in ZZ$. \
    Therefore, since $k$ is an integer, and $n = k^2$, thus by definition it is a perfect square as it is the square of another integer. \
    --- \
    Thus we have demonstrated that $forall n in ZZ^+, n$ is a perfect square $arrow.r.l$ all the exponents of $n$ are even in its standard form. \
    $qed$
]
#question("13")[
  #given("Statement", [Prove that $2$ is the only prime of the form $n^3 + 1$. ])
  = Proof:
  Let $n in ZZ$. \
  We want to show that $n^3 + 1$ is prime only for $2$. \
  Using the sum of cubes formula we get: \
  $n^3 + 1 = (n+1)(n^2 - n + 1)$ \
  By the definition of any prime integer, at least one of its divisors must be $1$ or $-1$. \
  == Case 1: $n + 1 = 1$ \
  This case forces $n + 1 = 1 arrow.r n = 0$ which gives us the equation: \
  $0^3 + 1 = 1$ \
  And by definition, $1$ is not a prime number. \
  == Case 2: $n+1 = -1$ \
  This case forces $n + 1 = -1 arrow.r n = -2$ which gives us the equation: \
  $(-2)^3 + 1 = -8 + 1$ \
  Again, $-7$ is not a prime number. \
  == Case 3: $n^2 - n + 1 = 1$ \
  This case simplifies to: $n^2 -n = 0 arrow.r n(n-1) = 0 arrow.r n = 0 or n = 1$ \
  For $n = 0$ see _Case 1_. \
  For $n = 1$, we get $1^3 +1 = 2$ which is a prime integer. \
  == Case 4: $n^2 - n + 1 = -1$ \
  This case simplifies to $n^2 - n +2 = 0 arrow.r D = (-1)^2 - 4(1)(2) = -7$. \
  Since the discriminant of the equation is $-7$, there are no real solutions to our quadratic equation. \
  --- \
  Since $2$ was the only possible prime integer that satisfied our equation, then by definition $2$ is the only prime of the form $n^3 + 1$. \
  $qed$

]

= Additional Problems

#question("1")[
  #given("Statement", [Let $a$ and $b$ be natural numbers. Prove that if $a + b$ is prime, then $gcd(a,b)=1$.])
  = Proof by Contradiction:
  Suppose not. Let $a, b in NN$ such that $a + b$ is prime and $gcd(a,b) > 1$. \
  Let $d = gcd(a,b)$. \
  Thus by definition, $a = d k_1$ and $b = d k_2$. \
  Thus we get that: \
  $a + b = d k_1 + d k_2 = d(k_1 + k_2)$. \
  Note here that we originally assumed $a + b$ is a prime number, thus the set of its divisors, $S$, is: ${1,-1, (a+b), -(a+b)}$. \
  However, we have demonstrated that $d|(a+b)$, moreover $d in.not S$ since $d > 1$ and $d != (a+b)$ as $d = (a+b)/(k_1+k_2)$. \
  Thus we have encountered a contradiction, since we assumed $a+b$ was prime number however $d|(a+b)$. \
  Therefore, since the negation leads to contradiction, the original statement must be true. \
  If $a + b$ is prime, then $gcd(a,b)=1$. \
  $qed$
]


#question("2")[
  #given("Statement", [If $p != 5$ is an odd prime, prove that either $p^2 - 1$ or $p^2 +1$ is divisible by 10.])
  = Proof:
  Let $p != 5$ be an odd prime. \
  We want to prove that either $10|p^2 -1$ or $10|p^2 + 1$. \
  By the division algorithm, we get that: \
  $p = 10q + r$ for some integers $q,r$ where $r in {1,3,7,9}$. \
  *Note*: We know $r in {1,3,7,9}$ since $0<=r<10$, $p$ is odd, moreover, $p != 5$, therefore it would not be within the remainder. \
  Thus, by congruence we get: \
  $p equiv 1,3,7,9 mod(10)$ \
  Squaring both sides our congruence would form into: \
  $p^2 equiv 1,9 mod(10)$ \
  For the next cases, instead of $9$, we will make use of $-1$ by shifting as: \
  $-1 equiv 9 mod(10)$.
  == Case 1: $p^2 - 1$
  Given $p^2 equiv 1,-1 mod(10)$, by definition $p^2 - 1 = 10k_1$ and $p^2 + 1 = 10k_2$ for some integers $k_1,k_2$. \
  For this case, we have demonstrated the conclusion as $p^2 - 1 = 10k_1$. \
  == Case 2: $p^2 + 1$
  Same, as case above, instead for $+1$ instead of $-1$. \
  $therefore$ If $p != 5$ is an odd prime, prove that either $p^2 - 1$ or $p^2 +1$ is divisible by 10. \
  $qed$
]
