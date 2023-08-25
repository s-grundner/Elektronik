---
tags: ["Algorithmus", ]
aliases: ["Linked List"]
subject: ["null"]
source: ["null"]
created: 17th April 2022
---

# Linked Lists

A linked list is a list of any elements which additionally points somewhere in the memory to the next element.

The first element is called **HEADER**, the last element is called **TAIL**.
The links inbetween are often called **edges** or **branches**
Unlike arrays, linked lists do not have to be a consistent memory-block and can *float* in the memory.

If a new element is needed, it just needs to be **allocated one time** and then linked-up with the other elements.

The order of the elements can easily be changed by changing the pointers to the next or previous elements, without reallocating or copying values. 

![525](../assets/singly_linked_list.svg)

> [!example] static allocated list

``` c
#include <stdlib.h>
#include <stdio.h>

struct node {
	int value;
	struct node* next;
};
typedef struct node node_t;

void print_list(node_t *head) 
 {
	node_t *temporary = head;
	while (temporary != NULL)
	{
		printf("%d - ", temporary->value);
		temporary = temporary->next;
	}
	printf("\n");
}

int main(int argc, char const *argv[])
{
	node_t n1, n2, n3;
	node_t *head;
	n1.value = 45;
	n2.value = 8;
	n3.value = 32;

	// link them up (the order can always can be changed as needed)
	head = &n3;
	n3.next = &n2;
	n2.next = &n1;
	n1.next = NULL; //so we know where to stop 

	print_list(head);
	return 0;
}
```

> [!note] Output: 32 - 8 - 45 -

---
# Tags
