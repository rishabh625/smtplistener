FROM docker.io/library/golang:1.14 AS builder

WORKDIR /app
COPY . .
RUN go build -o bin/smtplistener ./cmd/listener

FROM docker.io/library/debian:buster-slim
 
LABEL maintainer="Rishabh Mishra<rishabhmishra131@gmail.com>"
 
WORKDIR /app
COPY --from=builder /app/bin/smtplistener ./bin/smtplistener
COPY conf.json conf.json
EXPOSE 2525
RUN touch /tmp/test.com.key
RUN touch /tmp/test.com.crt
 
CMD ["./bin/smtplistener", "serve"]
