FROM golang:1.17.8-alpine as stage
WORKDIR /usr/src/app
COPY ./hello-world.go .
RUN go build hello-world.go

FROM scratch
WORKDIR /usr/src/app
COPY --from=stage /usr/src/app/hello-world .
CMD ["./hello-world"]