package rsum

/*

#cgo CFLAGS: -I../../../rsum/include
#cgo LDFLAGS: -L../../lib -lrsum -Wl,-rpath=./lib
#include "RsMath.h"

*/
import "C"

func Multiplay(a, b float64) float64 {
	got := C.multiply(C.double(a), C.double(b))
	return float64(got)
}
