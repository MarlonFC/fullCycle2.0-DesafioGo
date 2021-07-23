FROM golang:alpine as base

WORKDIR /go/src/app

COPY . .

RUN CGO_ENABLED=0 go build -o /app main.go

FROM scratch

COPY --from=base /app /app

CMD ["/app"]