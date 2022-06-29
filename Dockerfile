FROM golang:1.14
 
LABEL maintainer="Rishabh Mishra<rishabhmishra131@gmail.com>"
 
WORKDIR /app
COPY test ./bin/smtplistener
EXPOSE 2525
 
CMD ["./bin/smtplistener", "serve"]
