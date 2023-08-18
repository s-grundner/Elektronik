---
tags: ["ds-algo"]
aliases: []
subject: [""]
source: [""]
created: 18th April 2022
---
# Binary Search s

## Python Code
### Normal Version
~~~ python
def binary_search(list, target):
	first = 0
	last = len(list) - 1
	
	while first <= last:
		midpoint = (first + last) // 2
		
		if list[midpoint] == target:
			return midpoint
			
		elif list[midpoint] < target:
			first = midpoint + 1
			
		else:
			last = midpoint - 1
	
	return None
~~~
### Recursive Version
~~~ python
def recursive_binary_search(list, target):
	if len(list) == 0:
		return False
	else:
		midpoint = len(list) // 2
		
		if list[midpoint] == target:
			return True
		else:
			if list[midpoint] < target:
				return recursive_binary_search(list[midpoint+1:], target)
			else:
				return recursive_binary_search(list[:midpoint], target)
~~~

---
# Tags