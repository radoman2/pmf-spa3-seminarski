// PACKAGES USED
#import "@preview/fletcher:0.5.8" as f: diagram, node, edge

// DOCUMENT SETUP
#set heading(numbering: "1.1")
#show title: set align(center)
#title[DSA3 seminar assignment]
#set document(title:[DSA3 seminar assignment])
// dodati naslov na svakoj stranici gore u uglu

// SIGNATURE
#grid(
  columns: (1fr),
  align(center)[
    Radoman Radoman 157m/21 \
    University of Novi Sad, Faculty of Sciences \
    #link("mailto:radoman88@gmail.com")
  ]
)

#pagebreak()

= Introduction

#pagebreak()

= BFS and DFS
== Purpose and theoretical background

Both BFS (breadth-first search) and DFS (depth-first search) are tree-search algorithms. They are both used to determine whether a graph is connected.

*Theorem* \
A graph is connected if and only if, you can not split it into two such that there are no edges between them.

An approach to check wheter a graph is connected is by checking all the partitions (the problem is that there are $2^(n-1)$ of them so it is very inneficient). Another way to check whether a graph is connect is by checking all pairs of vertices - if there is a path connecting them (problem here again is that there are $n^2$ pairs of vertices and for each of them we have to check if there is a path which is also very inneficient on top of number of partitions that we would need to check).

*Definition* \
A graph is connected if and only if it has a spanning tree.

Checking whether a graph is connected in such a way (by determining whether it has a spanning tree) is far and away the most efficient way to check graph connectedness.

Both DFS and BFS work in a similar way (they both produce spanning trees), but with differences that impact the priority of edges selected. Depending on the way we used to choose edges we get different trees.

A *tree-search* algorithm on _G_: \
  > Start with a single root vertex $r space epsilon space V(G)$. This is our initial tree (with just one vertex). \
  > Repeat (for as long as possible): \
    - Do we have a spanning tree? \
    - Is the tree edge cut empty? \
    - If not, add one edge from the cut to the tree. \

If we want to check _connectedness_ of G, that is the whole algorithm. As noted above, depending on the way we use to choose edges, different spanning tree will result (if the graph is connected of course).

Define: edge cut, rooted tree (also called r-tree), levels (distance from root to a specific vertex), ancestor, descendant, parent or predecessor and children. \

Predecessor function: $p(v)$, for all $v space epsilon V space \ space {r}$ // FIX THIS AND DEFINE IT BETTER

#pagebreak()

== BFS

Adjacency lists of vertices are considered on a first-come-first serve basis. Implemented with a _queue_.

For a connected graph, the algorithm will return:
- A spanning tree given by its predecessor function,
- the level function,
- the time function (order in which vertices are added to the tree)

In BFS algorithm we will first consider the neighbors (one-by-one) before we look through the neighbours of any of them. \

Therefore, first edges incident to $r$ are selected, and only after that we are looking at neighbors of the neighbors of $r$. \

This is called Breadth-first search algorithm. This approach expands (spreads) the tree as much as possible. \

We start with just the root $r$ in the queue and we repeatedly pop the head of the queue, and push all its new neighbors to the queue.


\

=== BFS algorithm
> INPUT: a connected graph $G$, a vertex $r space epsilon V(G)$ \
> OUTPUT: an $r$-tree $T subset.eq G$, its predecessor function $p$, its level function $l$, the time function $t$



*BFS algorithm* \
// WRITE OUT COMPLETE ALGORITHM
$Q := emptyset,$ $space$ $Q arrow.l r, $ $space$ $l(r) := 0$ $space$ $t(r) := 1,$ $space$ mark $r, i := 1$ \
*while* $Q eq.not emptyset $ \
#pad(left:15pt)[consider the head $x$ of $Q$  \
$$if $x$ has unmarked neighbor $y$ *then*
]
#pad(left:30pt)[
  $i++$ \
  $Q arrow.l y$, $space$ mark $y$, $space$ $p(y) := x$, $space$ $l(y) := l(x) + 1$, $space$ $t(y) := i$
]
#pad(left:15pt)[*else*]
#pad(left:30pt)[remove head of $Q$]
#pad(left:15pt)[*end if*]
*end while* \
*return everything*

#pagebreak()

// DRAWING OUT BFS ALGORITHM
=== BFS example

// ROW 1
#grid(
columns: (1fr, 1fr, 1fr, 1fr),
align: (center + horizon),

grid(
  diagram(
    node-stroke: 0.6pt,
    node((0,0), [1], name: <1>),
    node((-1.1, -0.3), [2], name: <2>),
    node((0.2, 1.4), [3], name:<3>),
    node((0.9, 0.7), [4], name: <4>),
    node((1.1, -0.3), [5], name: <5>),
    node((-2.1, 0.2), [6], name:<6>),
    node((-1.0, 0.4), [7], name:<7>),
    node((-0.7, 1.3), [8], name:<8>),
    edge(<1>, <2>, "-"),    
    edge(<1>, <3>, "-"),
    edge(<1>, <4>, "-"),
    edge(<1>, <5>, "-"),
    edge(<2>, <6>, "-"),   
    edge(<2>, <7>, "-"),
    edge(<3>, <4>, "-"),
    edge(<3>, <7>, "-"),
    edge(<3>, <8>, "-"),
    edge(<4>, <7>, "-"),
    edge(<6>, <8>, "-"),
    ),
    [$emptyset$],
),

$arrow.r$,

grid(
  diagram(
    node-stroke: 0.6pt,
    node((0,0), text(red,[1]), name: <1>, stroke: 1pt + red),
    node((-1.1, -0.3), [2], name: <2>),
    node((0.2, 1.4), [3], name:<3>),
    node((0.9, 0.7), [4], name: <4>),
    node((1.1, -0.3), [5], name: <5>),
    node((-2.1, 0.2), [6], name:<6>),
    node((-1.0, 0.4), [7], name:<7>),
    node((-0.7, 1.3), [8], name:<8>),
    edge(<1>, <2>, "-"),    
    edge(<1>, <3>, "-"),
    edge(<1>, <4>, "-"),
    edge(<1>, <5>, "-"),
    edge(<2>, <6>, "-"),   
    edge(<2>, <7>, "-"),
    edge(<3>, <4>, "-"),
    edge(<3>, <7>, "-"),
    edge(<3>, <8>, "-"),
    edge(<4>, <7>, "-"),
    edge(<6>, <8>, "-"),
    ),
    [1],
),

$arrow.r$,
)


// ROW 2
#grid(
columns: (1fr, 1fr, 1fr, 1fr),
align: (center + horizon),

grid(
  diagram(
    node-stroke: 0.6pt,
    node((0,0), text(red, [1]), name: <1>, stroke: 1pt + red),
    node((-1.1, -0.3), text(red, [2]), name: <2>, stroke: 1pt + red),
    node((0.2, 1.4), [3], name:<3>),
    node((0.9, 0.7), [4], name: <4>),
    node((1.1, -0.3), [5], name: <5>),
    node((-2.1, 0.2), [6], name:<6>),
    node((-1.0, 0.4), [7], name:<7>),
    node((-0.7, 1.3), [8], name:<8>),
    edge(<1>, <2>, "-", stroke: 1pt + red),    
    edge(<1>, <3>, "-"),
    edge(<1>, <4>, "-"),
    edge(<1>, <5>, "-"),
    edge(<2>, <6>, "-"),   
    edge(<2>, <7>, "-"),
    edge(<3>, <4>, "-"),
    edge(<3>, <7>, "-"),
    edge(<3>, <8>, "-"),
    edge(<4>, <7>, "-"),
    edge(<6>, <8>, "-"),
    ),
    [12],
),

$arrow.r$,

grid(
  diagram(
    node-stroke: 0.6pt,
    node((0,0), text(red, [1]), name: <1>, stroke: 1pt + red),
    node((-1.1, -0.3), text(red, [2]), name: <2>, stroke: 1pt + red),
    node((0.2, 1.4), text(red, [3]), name:<3>, stroke: 1pt + red),
    node((0.9, 0.7), [4], name: <4>),
    node((1.1, -0.3), [5], name: <5>),
    node((-2.1, 0.2), [6], name:<6>),
    node((-1.0, 0.4), [7], name:<7>),
    node((-0.7, 1.3), [8], name:<8>),
    edge(<1>, <2>, "-", stroke: 1pt + red),    
    edge(<1>, <3>, "-", stroke: 1pt + red),
    edge(<1>, <4>, "-"),
    edge(<1>, <5>, "-"),
    edge(<2>, <6>, "-"),   
    edge(<2>, <7>, "-"),
    edge(<3>, <4>, "-"),
    edge(<3>, <7>, "-"),
    edge(<3>, <8>, "-"),
    edge(<4>, <7>, "-"),
    edge(<6>, <8>, "-"),
    ),
    [123],
),

$arrow.r$,
)


// ROW 3
#grid(
columns: (1fr, 1fr, 1fr, 1fr),
align: (center + horizon),

grid(
  diagram(
    node-stroke: 0.6pt,
    node((0,0), text(red,[1]), name: <1>, stroke: 1pt + red),
    node((-1.1, -0.3), text(red,[2]), name: <2>, stroke: 1pt + red),
    node((0.2, 1.4), text(red,[3]), name:<3>, stroke: 1pt + red),
    node((0.9, 0.7), text(red,[4]), name: <4>, stroke: 1pt + red),
    node((1.1, -0.3), [5], name: <5>),
    node((-2.1, 0.2), [6], name:<6>),
    node((-1.0, 0.4), [7], name:<7>),
    node((-0.7, 1.3), [8], name:<8>),
    edge(<1>, <2>, "-", stroke: 1pt + red),    
    edge(<1>, <3>, "-", stroke: 1pt + red),
    edge(<1>, <4>, "-", stroke: 1pt + red),
    edge(<1>, <5>, "-"),
    edge(<2>, <6>, "-"),   
    edge(<2>, <7>, "-"),
    edge(<3>, <4>, "-"),
    edge(<3>, <7>, "-"),
    edge(<3>, <8>, "-"),
    edge(<4>, <7>, "-"),
    edge(<6>, <8>, "-"),
    ),
    [1234],
),

$arrow.r$,

grid(
  diagram(
    node-stroke: 0.6pt,
    node((0,0), text(red,[1]), name: <1>, stroke: 1pt + red),
    node((-1.1, -0.3), text(red,[2]), name: <2>, stroke: 1pt + red),
    node((0.2, 1.4), text(red,[3]), name:<3>, stroke: 1pt + red),
    node((0.9, 0.7), text(red,[4]), name: <4>, stroke: 1pt + red),
    node((1.1, -0.3), text(red,[5]), name: <5>, stroke: 1pt + red),
    node((-2.1, 0.2), [6], name:<6>),
    node((-1.0, 0.4), [7], name:<7>),
    node((-0.7, 1.3), [8], name:<8>),
    edge(<1>, <2>, "-", stroke: 1pt + red),    
    edge(<1>, <3>, "-", stroke: 1pt + red),
    edge(<1>, <4>, "-", stroke: 1pt + red),
    edge(<1>, <5>, "-", stroke: 1pt + red),
    edge(<2>, <6>, "-"),   
    edge(<2>, <7>, "-"),
    edge(<3>, <4>, "-"),
    edge(<3>, <7>, "-"),
    edge(<3>, <8>, "-"),
    edge(<4>, <7>, "-"),
    edge(<6>, <8>, "-"),
    ),
    [12345],
),

$arrow.r$,
)



// ROW 4
#grid(
columns: (1fr, 1fr, 1fr, 1fr),
align: (center + horizon),

grid(
  diagram(
    node-stroke: 0.6pt,
    node((0,0), text(red,[1]), name: <1>, stroke: 1pt + red),
    node((-1.1, -0.3), text(red,[2]), name: <2>, stroke: 1pt + red),
    node((0.2, 1.4), text(red,[3]), name:<3>, stroke: 1pt + red),
    node((0.9, 0.7), text(red,[4]), name: <4>, stroke: 1pt + red),
    node((1.1, -0.3), text(red,[5]), name: <5>, stroke: 1pt + red),
    node((-2.1, 0.2), text(red,[6]), name:<6>, stroke: 1pt + red),
    node((-1.0, 0.4), [7], name:<7>),
    node((-0.7, 1.3), [8], name:<8>),
    edge(<1>, <2>, "-", stroke: 1pt + red),    
    edge(<1>, <3>, "-", stroke: 1pt + red),
    edge(<1>, <4>, "-", stroke: 1pt + red),
    edge(<1>, <5>, "-", stroke: 1pt + red),
    edge(<2>, <6>, "-", stroke: 1pt + red),   
    edge(<2>, <7>, "-"),
    edge(<3>, <4>, "-"),
    edge(<3>, <7>, "-"),
    edge(<3>, <8>, "-"),
    edge(<4>, <7>, "-"),
    edge(<6>, <8>, "-"),
    ),
    [23456],
),

$arrow.r$,

grid(
  diagram(
    node-stroke: 0.6pt,
    node((0,0), text(red,[1]), name: <1>, stroke: 1pt + red),
    node((-1.1, -0.3), text(red,[2]), name: <2>, stroke: 1pt + red),
    node((0.2, 1.4), text(red,[3]), name:<3>, stroke: 1pt + red),
    node((0.9, 0.7), text(red,[4]), name: <4>, stroke: 1pt + red),
    node((1.1, -0.3), text(red,[5]), name: <5>, stroke: 1pt + red),
    node((-2.1, 0.2), text(red,[6]), name:<6>, stroke: 1pt + red),
    node((-1.0, 0.4), text(red,[7]), name:<7>, stroke: 1pt + red),
    node((-0.7, 1.3), [8], name:<8>),
    edge(<1>, <2>, "-", stroke: 1pt + red),    
    edge(<1>, <3>, "-", stroke: 1pt + red),
    edge(<1>, <4>, "-", stroke: 1pt + red),
    edge(<1>, <5>, "-", stroke: 1pt + red),
    edge(<2>, <6>, "-", stroke: 1pt + red),   
    edge(<2>, <7>, "-", stroke: 1pt + red),
    edge(<3>, <4>, "-"),
    edge(<3>, <7>, "-"),
    edge(<3>, <8>, "-"),
    edge(<4>, <7>, "-"),
    edge(<6>, <8>, "-"),
    ),
    [234567],
),

$arrow.r$,
)



// ROW 5
#grid(
columns: (1fr, 1fr, 1fr, 1fr),
align: (center + horizon),

grid(
  diagram(
    node-stroke: 0.6pt,
    node((0,0), text(red,[1]), name: <1>, stroke: 1pt + red),
    node((-1.1, -0.3), text(red,[2]), name: <2>, stroke: 1pt + red),
    node((0.2, 1.4), text(red,[3]), name:<3>, stroke: 1pt + red),
    node((0.9, 0.7), text(red,[4]), name: <4>, stroke: 1pt + red),
    node((1.1, -0.3), text(red,[5]), name: <5>, stroke: 1pt + red),
    node((-2.1, 0.2), text(red,[6]), name:<6>, stroke: 1pt + red),
    node((-1.0, 0.4), text(red,[7]), name:<7>, stroke: 1pt + red),
    node((-0.7, 1.3), text(red,[8]), name:<8>, stroke: 1pt + red),
    edge(<1>, <2>, "-", stroke: 1pt + red),    
    edge(<1>, <3>, "-", stroke: 1pt + red),
    edge(<1>, <4>, "-", stroke: 1pt + red),
    edge(<1>, <5>, "-", stroke: 1pt + red),
    edge(<2>, <6>, "-", stroke: 1pt + red),   
    edge(<2>, <7>, "-", stroke: 1pt + red),
    edge(<3>, <4>, "-"),
    edge(<3>, <7>, "-"),
    edge(<3>, <8>, "-", stroke: 1pt + red),
    edge(<4>, <7>, "-"),
    edge(<6>, <8>, "-"),
    ),
    [345678],
),

block( //placeholder
),

block(
  [*detailed* _(queue is used)_ \
  $emptyset arrow.r$ 1 $arrow.r$ 12 $arrow.r$ 123 $arrow.r$ 1234 $arrow.r$ 12345 $arrow.r$ 2345 $arrow.r$ 23456 $arrow.r$ 234567 $arrow.r$
  34567 $arrow.r$ 345678 $arrow.r$ 45678 $arrow.r$ 5678 $arrow.r$ 678 $arrow.r$ 78 $arrow.r$ 8 $arrow.r emptyset$
  ]
)

)

#pagebreak()

=== BFS properties

*Theorem* Let $T$ be a BFS tree of $G$, with root $r$. \
#pad(left:15pt)[a.) $l(v) = d_T (r,v)$, $space$, for every $v in V$,]
#pad(left:15pt)[b.) $|l(u) - l(v)| lt.eq.slant 1$, for every $u v in E(G)$.]

Level of $v$ is exactly the distance from root $r$ to $v$. \

Every edge of the graph connects only vertices of the same level of the tree or difference by most 1. \ \

*Theorem* Let $T$ be a BFS tree of $G$, with root $r$. Then \
#pad(left:15pt)[$l(v) = d_G (r,v)$, for every $v in V$]

As seen from our example above.


#pagebreak()

== DFS

=== DFS algorithm
Completely the same as BFS, except that we use a *stack* instead of a queue.

> INPUT: a connected graph $G$, a vertex $r space epsilon V(G)$ \
> OUTPUT: an $r$-tree $T subset.eq G$, its predecessor function $p$, its level function $l$, the time function $t$


*DFS algorithm* \
// WRITE OUT COMPLETE ALGORITHM
$S := emptyset,$ $space$ $S arrow.l r, $ $space$ $l(r) := 0$ $space$ $t(r) := 1,$ $space$ mark $r, i := 1$ \
*while* $S eq.not emptyset $ \
#pad(left:15pt)[consider the top vertex $x$ of $S$ \
$$if $x$ has unmarked neighbor $y$ *then*
]
#pad(left:30pt)[
  $i++$ \
  move $y$ to the top of $S$, $space$ mark $y$, $space$ $p(y) := x$, $space$ $l(y) := l(x) + 1$, $space$ $t(y) := i$
]
#pad(left:15pt)[*else*]
#pad(left:30pt)[remove $x$ from $S$]
#pad(left:15pt)[*end if*]
*end while* \
*return everything*



#pagebreak()

=== DFS example

// ROW 1
#grid(
columns: (1fr, 1fr, 1fr, 1fr),
align: (center + horizon),

grid(
  diagram(
    node-stroke: 0.6pt,
    node((0,0), [1], name: <1>),
    node((-1.1, -0.3), [2], name: <2>),
    node((0.2, 1.4), [3], name:<3>),
    node((0.9, 0.7), [4], name: <4>),
    node((1.1, -0.3), [5], name: <5>),
    node((-2.1, 0.2), [6], name:<6>),
    node((-1.0, 0.4), [7], name:<7>),
    node((-0.7, 1.3), [8], name:<8>),
    edge(<1>, <2>, "-"),    
    edge(<1>, <3>, "-"),
    edge(<1>, <4>, "-"),
    edge(<1>, <5>, "-"),
    edge(<2>, <6>, "-"),   
    edge(<2>, <7>, "-"),
    edge(<3>, <4>, "-"),
    edge(<3>, <7>, "-"),
    edge(<3>, <8>, "-"),
    edge(<4>, <7>, "-"),
    edge(<6>, <8>, "-"),
    ),
    [$emptyset$],
),

$arrow.r$,

grid(
  diagram(
    node-stroke: 0.6pt,
    node((0,0), text(red,[1]), name: <1>, stroke: 1pt + red),
    node((-1.1, -0.3), [2], name: <2>),
    node((0.2, 1.4), [3], name:<3>),
    node((0.9, 0.7), [4], name: <4>),
    node((1.1, -0.3), [5], name: <5>),
    node((-2.1, 0.2), [6], name:<6>),
    node((-1.0, 0.4), [7], name:<7>),
    node((-0.7, 1.3), [8], name:<8>),
    edge(<1>, <2>, "-"),    
    edge(<1>, <3>, "-"),
    edge(<1>, <4>, "-"),
    edge(<1>, <5>, "-"),
    edge(<2>, <6>, "-"),   
    edge(<2>, <7>, "-"),
    edge(<3>, <4>, "-"),
    edge(<3>, <7>, "-"),
    edge(<3>, <8>, "-"),
    edge(<4>, <7>, "-"),
    edge(<6>, <8>, "-"),
    ),
    [1],
),

$arrow.r$,
)



// ROW 2
#grid(
columns: (1fr, 1fr, 1fr, 1fr),
align: (center + horizon),

grid(
  diagram(
    node-stroke: 0.6pt,
    node((0,0), text(red,[1]), name: <1>, stroke: 1pt + red),
    node((-1.1, -0.3), text(red,[2]), name: <2>, stroke: 1pt + red),
    node((0.2, 1.4), [3], name:<3>),
    node((0.9, 0.7), [4], name: <4>),
    node((1.1, -0.3), [5], name: <5>),
    node((-2.1, 0.2), [6], name:<6>),
    node((-1.0, 0.4), [7], name:<7>),
    node((-0.7, 1.3), [8], name:<8>),
    edge(<1>, <2>, "-", stroke: 1pt + red),    
    edge(<1>, <3>, "-"),
    edge(<1>, <4>, "-"),
    edge(<1>, <5>, "-"),
    edge(<2>, <6>, "-"),   
    edge(<2>, <7>, "-"),
    edge(<3>, <4>, "-"),
    edge(<3>, <7>, "-"),
    edge(<3>, <8>, "-"),
    edge(<4>, <7>, "-"),
    edge(<6>, <8>, "-"),
    ),
    [12],
),

$arrow.r$,

grid(
  diagram(
    node-stroke: 0.6pt,
    node((0,0), text(red,[1]), name: <1>, stroke: 1pt + red),
    node((-1.1, -0.3), text(red,[2]), name: <2>, stroke: 1pt + red),
    node((0.2, 1.4), [3], name:<3>),
    node((0.9, 0.7), [4], name: <4>),
    node((1.1, -0.3), [5], name: <5>),
    node((-2.1, 0.2), [6], name:<6>),
    node((-1.0, 0.4), text(red,[7]), name:<7>, stroke: 1pt + red),
    node((-0.7, 1.3), [8], name:<8>),
    edge(<1>, <2>, "-", stroke: 1pt + red),    
    edge(<1>, <3>, "-"),
    edge(<1>, <4>, "-"),
    edge(<1>, <5>, "-"),
    edge(<2>, <6>, "-"),   
    edge(<2>, <7>, "-", stroke: 1pt + red),
    edge(<3>, <4>, "-"),
    edge(<3>, <7>, "-"),
    edge(<3>, <8>, "-"),
    edge(<4>, <7>, "-"),
    edge(<6>, <8>, "-"),
    ),
    [127],
),

$arrow.r$,
)



// ROW 3
#grid(
columns: (1fr, 1fr, 1fr, 1fr),
align: (center + horizon),

grid(
  diagram(
    node-stroke: 0.6pt,
    node((0,0), text(red,[1]), name: <1>, stroke: 1pt + red),
    node((-1.1, -0.3), text(red,[2]), name: <2>, stroke: 1pt + red),
    node((0.2, 1.4), text(red,[3]), name:<3>, stroke: 1pt + red),
    node((0.9, 0.7), [4], name: <4>),
    node((1.1, -0.3), [5], name: <5>),
    node((-2.1, 0.2), [6], name:<6>),
    node((-1.0, 0.4), text(red,[7]), name:<7>, stroke: 1pt + red),
    node((-0.7, 1.3), [8], name:<8>),
    edge(<1>, <2>, "-", stroke: 1pt + red),    
    edge(<1>, <3>, "-"),
    edge(<1>, <4>, "-"),
    edge(<1>, <5>, "-"),
    edge(<2>, <6>, "-"),   
    edge(<2>, <7>, "-", stroke: 1pt + red),
    edge(<3>, <4>, "-"),
    edge(<3>, <7>, "-", stroke: 1pt + red),
    edge(<3>, <8>, "-"),
    edge(<4>, <7>, "-"),
    edge(<6>, <8>, "-"),
    ),
    [1273],
),

$arrow.r$,

grid(
  diagram(
    node-stroke: 0.6pt,
    node((0,0), text(red,[1]), name: <1>, stroke: 1pt + red),
    node((-1.1, -0.3), text(red,[2]), name: <2>, stroke: 1pt + red),
    node((0.2, 1.4), text(red,[3]), name:<3>, stroke: 1pt + red),
    node((0.9, 0.7), text(red,[4]), name: <4>, stroke: 1pt + red),
    node((1.1, -0.3), [5], name: <5>),
    node((-2.1, 0.2), [6], name:<6>),
    node((-1.0, 0.4), text(red,[7]), name:<7>, stroke: 1pt + red),
    node((-0.7, 1.3), [8], name:<8>),
    edge(<1>, <2>, "-", stroke: 1pt + red),    
    edge(<1>, <3>, "-"),
    edge(<1>, <4>, "-"),
    edge(<1>, <5>, "-"),
    edge(<2>, <6>, "-"),   
    edge(<2>, <7>, "-", stroke: 1pt + red),
    edge(<3>, <4>, "-", stroke: 1pt + red),
    edge(<3>, <7>, "-", stroke: 1pt + red),
    edge(<3>, <8>, "-"),
    edge(<4>, <7>, "-"),
    edge(<6>, <8>, "-"),
    ),
    [12734],
),

$arrow.r$,
)



// ROW 4
#grid(
columns: (1fr, 1fr, 1fr, 1fr),
align: (center + horizon),

grid(
  diagram(
    node-stroke: 0.6pt,
    node((0,0), text(red,[1]), name: <1>, stroke: 1pt + red),
    node((-1.1, -0.3), text(red,[2]), name: <2>, stroke: 1pt + red),
    node((0.2, 1.4), text(red,[3]), name:<3>, stroke: 1pt + red),
    node((0.9, 0.7), text(red,[4]), name: <4>, stroke: 1pt + red),
    node((1.1, -0.3), [5], name: <5>),
    node((-2.1, 0.2), [6], name:<6>),
    node((-1.0, 0.4), text(red,[7]), name:<7>, stroke: 1pt + red),
    node((-0.7, 1.3), text(red,[8]), name:<8>, stroke: 1pt + red),
    edge(<1>, <2>, "-", stroke: 1pt + red),    
    edge(<1>, <3>, "-"),
    edge(<1>, <4>, "-"),
    edge(<1>, <5>, "-"),
    edge(<2>, <6>, "-"),   
    edge(<2>, <7>, "-", stroke: 1pt + red),
    edge(<3>, <4>, "-", stroke: 1pt + red),
    edge(<3>, <7>, "-", stroke: 1pt + red),
    edge(<3>, <8>, "-", stroke: 1pt + red),
    edge(<4>, <7>, "-"),
    edge(<6>, <8>, "-"),
    ),
    [12738],
),

$arrow.r$,

grid(
  diagram(
    node-stroke: 0.6pt,
    node((0,0), text(red,[1]), name: <1>, stroke: 1pt + red),
    node((-1.1, -0.3), text(red,[2]), name: <2>, stroke: 1pt + red),
    node((0.2, 1.4), text(red,[3]), name:<3>, stroke: 1pt + red),
    node((0.9, 0.7), text(red,[4]), name: <4>, stroke: 1pt + red),
    node((1.1, -0.3), [5], name: <5>),
    node((-2.1, 0.2), text(red,[6]), name:<6>, stroke: 1pt + red),
    node((-1.0, 0.4), text(red,[7]), name:<7>, stroke: 1pt + red),
    node((-0.7, 1.3), text(red,[8]), name:<8>, stroke: 1pt + red),
    edge(<1>, <2>, "-", stroke: 1pt + red),    
    edge(<1>, <3>, "-"),
    edge(<1>, <4>, "-"),
    edge(<1>, <5>, "-"),
    edge(<2>, <6>, "-"),   
    edge(<2>, <7>, "-", stroke: 1pt + red),
    edge(<3>, <4>, "-", stroke: 1pt + red),
    edge(<3>, <7>, "-", stroke: 1pt + red),
    edge(<3>, <8>, "-", stroke: 1pt + red),
    edge(<4>, <7>, "-"),
    edge(<6>, <8>, "-", stroke: 1pt + red),
    ),
    [127386],
),

$arrow.r$,
)



// ROW 5
#grid(
columns: (1fr, 1fr, 1fr, 1fr),
align: (center + horizon),

grid(
  diagram(
    node-stroke: 0.6pt,
    node((0,0), text(red,[1]), name: <1>, stroke: 1pt + red),
    node((-1.1, -0.3), text(red,[2]), name: <2>, stroke: 1pt + red),
    node((0.2, 1.4), text(red,[3]), name:<3>, stroke: 1pt + red),
    node((0.9, 0.7), text(red,[4]), name: <4>, stroke: 1pt + red),
    node((1.1, -0.3), text(red,[5]), name: <5>, stroke: 1pt + red),
    node((-2.1, 0.2), text(red,[6]), name:<6>, stroke: 1pt + red),
    node((-1.0, 0.4), text(red,[7]), name:<7>, stroke: 1pt + red),
    node((-0.7, 1.3), text(red,[8]), name:<8>, stroke: 1pt + red),
    edge(<1>, <2>, "-", stroke: 1pt + red),    
    edge(<1>, <3>, "-"),
    edge(<1>, <4>, "-"),
    edge(<1>, <5>, "-", stroke: 1pt + red),
    edge(<2>, <6>, "-"),   
    edge(<2>, <7>, "-", stroke: 1pt + red),
    edge(<3>, <4>, "-", stroke: 1pt + red),
    edge(<3>, <7>, "-", stroke: 1pt + red),
    edge(<3>, <8>, "-", stroke: 1pt + red),
    edge(<4>, <7>, "-"),
    edge(<6>, <8>, "-", stroke: 1pt + red),
    ),
    [15],
  ),


block( //placeholder
),

block(
  [*detailed* _(stack is used)_ \
  $emptyset arrow.r$ 1 $arrow.r$ 12 $arrow.r$ 127 $arrow.r$ 1273 $arrow.r$ 12734 $arrow.r$ 1273 $arrow.r$ 12738 $arrow.r$ 127386 $arrow.r$
  12738 $arrow.r$ 1273 $arrow.r$ 127 $arrow.r$ 12 $arrow.r$ 1 $arrow.r$ 15 $arrow.r$ 1 $arrow.r emptyset$]
)



)





#pagebreak()

= Applications

#pagebreak()

= Conculsion


