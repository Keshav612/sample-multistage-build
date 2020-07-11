FROM golang:alpine3.9 as Builder

RUN apk add git

# Add Maintainer Info
LABEL maintainer="<Keshav Mishra>"

WORKDIR /helloworld
COPY helloworld.go .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o helloworld .

FROM alpine:latest
WORKDIR /root

COPY --from=Builder /helloworld/helloworld .
CMD ["./helloworld"] 
