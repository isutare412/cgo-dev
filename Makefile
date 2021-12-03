.DEFAULT_GOAL := help

ROOTDIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

.PHONY: rsum
rsum: ## Build rsum library into gosum lib directory
	cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release \
		-S ${ROOTDIR}/rsum \
		-B ${ROOTDIR}/build \
		-G "Unix Makefiles" && \
	cmake --build ${ROOTDIR}/build \
		--target rsum && \
	cp ${ROOTDIR}/build/*.so ${ROOTDIR}/gosum/lib/

.PHONY: gosum
gosum: rsum ## Build gosum executable
	cd ${ROOTDIR}/gosum && \
	go build \
		-o ${ROOTDIR}/gosum/lib/gosum \
		cmd/main.go

.PHONY: run
run: gosum ## Run gosum executable
	cd ${ROOTDIR}/gosum/lib && \
	./gosum

.PHONY: help
help: ## Print this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'