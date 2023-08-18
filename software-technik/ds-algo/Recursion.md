---
tags: ["ds-algo"]
aliases: []
subject: ["fsst"]
source: ["Anton Hofmann", "freecodecamp.org"]
created: 18th April 2022
---

# Recursion
The number a function called *itself*, is called **recursive depth**.

| pros                                                             | cons                                                      |
| ---------------------------------------------------------------- | --------------------------------------------------------- |
| Bridges the gap between elegance and complexity                  | Slowness due to CPU-Overhead                              |
| Reduces the need for complex loops and auxiliary data Structures | Can lead to out-of-memory errors/stackoverflow-exceptions |
| Cane Reduce [time complexity](O-Notation%5C) easily with [#Memoisation](#Memoisation)              | Can be unnecessarily complex if poorly constructed        |
| Works really well with recursive structures (Trees, Graphs)      |                                                           |

## Principle
A recursive function returns itself as a function call. A *Base-Case*(Stop condition) is required.
### Basic Attempt / Tought Process

````ad-example
title: reverseString
```java
public String reverseString(String input) {
	// What is the base case?
	if (input.equals("")) {
		return ""; 
	}
	// What is the smallest amount of work i can do in each iteration?
	return reverseString(input.substring(1)) + input.charAt(0);
}
```
![275](reverseString_callStack.svg)
````


## Memoisation
To reduce [time complexity](O-Notation.md), it is recommended to save repeating patterns (in objects or structs).

````ad-example 
title: fibonacci
non-optimized function, without memoization:
[time complexity](O-Notation.md): $O(2^{n})$❌
[space complexity](O-Notation.md): $O(n)$ ✅
``` js
const fib = (n) => {
	if(n <= 2) return 1;
	return fib(n - 1) + fib(n - 2);
}
```
optimized function, with memoization:
[time complexity](O-Notation.md): $O(n)$ ✅
[space complexity](O-Notation%5C): $O(n)$ ✅
```js
const fib = (n, memo = {}) => {
	if(n in memo) return memo[n];
	if (n <= 2) return 1;
	memo[n] = fib(n-1, memo) + fib(n-2, memo);
	return memo[n];
}
```
repeated patterns in the recursion tree are saved in the `memo` object.
![650](fib_tree.svg)
``` js
memo = {
	// memo contents
	1, // n=1 
	1, // n=2
	2, // n=3
	3, // n=4
	5, // n=5
	8, // n=6
	// ...
}
```
````

````ad-example
title: gridTraveler
Say that you are a traveler on a 2D grid. You begin in the top-left corner and your goal is to travel to the bottom-right corner. You may only move down or right.

In how many ways can you travel to the goal on a grid with dimensions $m\cdot n$

Write a function `gridTraveler(m, n)` that calculates this.

|**Example**|`gridTraveler(2,3)` $\rightarrow$ 3 |
|-|-|
| 1. right, right, down<br> 2. right, down, right <br> 3. down, right, right<br>|![gridTraveler(2,3)](gridTraveler(2,3).svg) |

````

---
# Tags
<iframe width="560" height="315" src="https://www.youtube.com/embed/oBt53YbR9Kk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/IJDJ0kBx2LM" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## [Tail-Call-Optimisations (TCO)](https://stackoverflow.com/questions/310974/what-is-tail-call-optimization).
