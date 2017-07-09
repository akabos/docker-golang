FROM debian:stretch

RUN apt-get update
RUN apt-get install -y \
	curl ca-certificates build-essential golang-any git bzr mercurial upx

WORKDIR /usr/local
ADD https://storage.googleapis.com/golang/go1.8.3.src.tar.gz ./
WORKDIR /usr/local/go/src
RUN GOROOT_BOOTSTRAP=/usr/lib/go GOOS=linux GOARCH=amd64 bash ./make.bash

RUN apt-get remove -y golang-any; apt-get autoremove -y; apt-get clean

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

RUN go get github.com/golang/dep/cmd/dep
RUN go get github.com/Masterminds/glide

WORKDIR $GOPATH
