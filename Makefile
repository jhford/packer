all:
	@mkdir -p bin/
	go get -d -v ./...
	go build -v -o bin/packer

format:
	go fmt ./...

test:
	@go list -f '{{range .TestImports}}{{.}}\
		{{end}}' ./... | xargs -n1 go get -d
	go test ./...

.PHONY: all format test