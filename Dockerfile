# build the bin file
FROM golang:1.23 AS builder
WORKDIR /app
COPY . .
RUN go mod download
RUN go build -o main main.go

# Run stage
FROM debian:bookworm-slim
WORKDIR /app
COPY --from=builder /app/main .
COPY app.env .
COPY db/migration ./db/migration

EXPOSE 8080
ENTRYPOINT [ "/app/main" ]