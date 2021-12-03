package main

import (
	"fmt"

	"github.com/isutare412/cgo-dev/gosum/pkg/rsum"
)

func main() {
	got := rsum.Multiplay(42, 45)
	fmt.Printf("Got: %f\n", got)
}
