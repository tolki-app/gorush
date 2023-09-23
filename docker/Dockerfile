FROM golang:1.21-alpine AS build

RUN apk add --no-cache git
RUN apk add gcc build-base

RUN mkdir -p /go/src/gorush
WORKDIR /go/src/gorush

COPY . .

WORKDIR /go/src/gorush
RUN go install

FROM alpine:3.17

FROM alpine:latest

# Create a new user and group 'appuser' (use any name you prefer)
RUN addgroup -S appuser && adduser -S appuser -G appuser

# Change the ownership of the binary to the new user
COPY --from=build /go/bin/gorush /usr/local/bin/

# Use the new user to run the binary
USER appuser

# Set the entrypoint to your binary
ENTRYPOINT ["gorush"]
