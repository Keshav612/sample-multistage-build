FROM golang:1.12.0-alpine3.9 as builder

RUN apk add git

# Add Maintainer Info
LABEL maintainer="<Keshav Mishra>"

RUN mkdir /app
ADD . /app
WORKDIR /app

COPY helloworld.go ./
RUN go mod download

COPY . .

# Build the Go app
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

# GO Repo base repo
FROM alpine:latest

RUN apk --no-cache add ca-certificates curl

RUN mkdir /app

WORKDIR /app/

# Copy the Pre-built binary file from the previous stage
COPY --from=builder /app/main .
