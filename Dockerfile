FROM golang:1.19-alpine3.16 AS builder

WORKDIR /app
COPY . .
RUN apk --no-cache add curl
RUN curl -L https://github.com/golang-migrate/migrate/releases/download/v4.15.2/migrate.linux-amd64.tar.gz | tar xvz
RUN go build -o main main.go

# Run stage
FROM alpine:3.16
WORKDIR /app
COPY --from=builder /app/main .
COPY --from=builder /app/migrate ./migrate
COPY config.env .
COPY start.sh .
COPY wait-for.sh .
COPY internal/db/migration ./migration

EXPOSE 8000
CMD [ "/app/main" ]
ENTRYPOINT [ "/app/start.sh" ]