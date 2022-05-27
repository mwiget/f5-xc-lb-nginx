FROM golang:latest as builder
COPY server.go .
RUN go build \
  -ldflags "-linkmode external -extldflags -static" \
  -a server.go

FROM alpine:latest
RUN apk add --no-cache curl
COPY --from=builder /go/server ./server

COPY entrypoint.sh /
ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
