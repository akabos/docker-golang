FROM debian:stretch

RUN apt-get update && \
	apt-get install -y \
		curl ca-certificates \
		build-essential \
		golang-any \
		git bzr mercurial \
		upx

WORKDIR /usr/local
ADD https://storage.googleapis.com/golang/go1.8.3.src.tar.gz ./
WORKDIR /usr/local/go/src
RUN GOROOT_BOOTSTRAP=/usr/lib/go GOOS=linux GOARCH=amd64 bash ./make.bash
RUN ln -s /usr/local/go/bin/go /usr/local/bin/go
RUN apt-get remove -y golang-any; apt-get autoremove -y; apt-get clean
RUN rm -rf /var/lib/apt/lists/*

ENV GOPATH /usr/local/gotools
RUN go get github.com/golang/dep/cmd/dep
RUN go get github.com/Masterminds/glide

RUN ln -s $GOPATH/bin/* /usr/local/bin

ENV GOPATH /go
ENV PATH $GOPATH/bin:$PATH

WORKDIR $GOPATH
