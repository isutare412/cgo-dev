# cgo-dv

An `cgo` example repostiory using C shared library as its dependency.

## Test

```bash
# Build C shared library
make rsum

# Build go executable that depends on rsum
make gosum

# Run the executable
make run
```
