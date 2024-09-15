FROM golang:1.20-alpine AS builder

ENV CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64

LABEL name="SAIRAM REDDY VAKA"

WORKDIR /app


COPY go.mod go.sum ./


RUN go mod tidy


COPY . .


RUN go build -o myapp .  


FROM alpine:latest



WORKDIR /app


COPY --from=builder /app/myapp .


EXPOSE 8081


CMD ["./myapp"]
