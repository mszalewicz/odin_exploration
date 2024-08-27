package main

import "core:fmt"

main :: proc() {
	a: [dynamic]int = [dynamic]int{1, 2, 3, 4, 5, 6, 7}

	append(&a, 4, 5)
	b := a[2:len(a)]
	c: [dynamic]int
	append(&c, ..a[2:len(a)])

	printValues(..a[3:5])
	printValues(1, 2, 3, 4)


	fmt.println(b)
}

printValues :: proc(a: ..int) {
	for value in a {
		fmt.println(value)
	}
}
