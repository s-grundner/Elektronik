---
tags:
  - Algorithmus/Suchen
aliases:
subject:
created: 17th April 2022
complexity: $\mathcal{O}(n)$
---

# Linear Search

> [!info] Complexity: `$=dv.current().complexity`

## [Python](../Python/Python.md) Code

~~~ python
def linear_search(list, target):
	# Returns the index position of the target if found
	# else returns None

	for i in range(0, len(list)):
		if list[i] == target:
			return i
	return None
~~~

---

# Tags