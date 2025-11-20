// PACKAGES USED
#import "@preview/fletcher:0.5.8" as f: diagram, node, edge

// DOCUMENT SETUP
#set heading(numbering: "1.1")
#show title: set align(center)
#title[DSA3 seminar paper]
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

Adjacency lists of vertices are considered on a first-come-first serve basis.

Implemented with a _queue_:

Start with just the root in the queue.

Repeatedly pop the head of the queue, and push all its new neighbors to the queue.

For a connected graph, the algorithm will return:
- A spanning tree given by its predecessor function,
- the level function,
- the time function (order in which vertices are added to the tree)

\

=== BFS algorithm
> INPUT: a connected graph $G$, a vertex $r space epsilon V(G)$ \
> OUTPUT: an $r$-tree $T in G$, its predecessor function $p$, its level function $l$, the time function $t$.


// WRITE OUT COMPLETE ALGORITHM
$Q space := emptyset,$ $Q space arrow.l r,$ $l(r) := 0$ $t(r) := 1,$ mark $r, i := 1$ \
*while* $Q space note emptyset $

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
    edge(<3>, <4>, "-", stroke: 1pt + red),
    edge(<3>, <7>, "-"),
    edge(<3>, <8>, "-", stroke: 1pt + red),
    edge(<4>, <7>, "-"),
    edge(<6>, <8>, "-"),
    ),
    [345678],
)
)

#pagebreak()

== DFS

=== DFS algorithm

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
    edge(<3>, <4>, "-"),
    edge(<3>, <7>, "-", stroke: 1pt + red),
    edge(<3>, <8>, "-", stroke: 1pt + red),
    edge(<4>, <7>, "-"),
    edge(<6>, <8>, "-", stroke: 1pt + red),
    ),
    [15],
  ),


block( //placeholder
  fill: gray,
),

block(
  [detailed (stack is used) \
  $emptyset arrow.r$ 1 $arrow.r$ 12 $arrow.r$ 127 $arrow.r$ 1273 $arrow.r$]
)



)





#pagebreak()

= Applications

#pagebreak()

= Conculsion


