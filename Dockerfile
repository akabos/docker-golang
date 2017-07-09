FROM golang:1.8

RUN apt-get update
RUN apt-get install -y --no-install-recommends curl ca-certificates build-essential git bzr mercurial
RUN apt-get clean
RUN go get -u github.com/golang/dep/cmd/dep
RUN curl https://glide.sh/get | sh
