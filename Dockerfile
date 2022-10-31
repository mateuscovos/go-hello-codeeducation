FROM golang:1.19.2 as goBuilder
WORKDIR /usr/src/app
COPY ./main.go .
RUN go build -o bin/hello main.go

#Otimização
FROM scratch
WORKDIR /usr/bin
COPY --from=goBuilder /usr/src/app/bin/hello .
ENTRYPOINT [ "hello" ]