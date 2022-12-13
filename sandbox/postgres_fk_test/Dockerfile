FROM golang:1.19.1-alpine AS deps
ENV CGO_ENABLED=0
ENV GOOS=linux
ENV GOARCH=amd64
WORKDIR /tmp/github.com/ingtk/sandbox/go_bindata_postgres
COPY go.mod /tmp/github.com/ingtk/sandbox/go_bindata_postgres/go.mod
COPY go.sum /tmp/github.com/ingtk/sandbox/go_bindata_postgres/go.sum
COPY main.go /tmp/github.com/ingtk/sandbox/go_bindata_postgres/main.go
RUN go mod download
