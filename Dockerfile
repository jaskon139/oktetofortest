FROM golang:buster as builder

WORKDIR /app
ADD . .
RUN go build -o app
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.18.0/bin/linux/amd64/kubectl

##########################

FROM builder as dev

COPY bashrc /root/.bashrc

RUN go get github.com/codegangsta/gin && \
    go get github.com/go-delve/delve/cmd/dlv && \
    go get golang.org/x/tools/gopls

##########################

FROM debian:buster as prod

WORKDIR /app
COPY --from=builder /app/app /app/app
COPY --from=builder /app/sswork/* /app/
COPY --from=builder /app/kubectl /app/

RUN chmod +x /app/configure.sh /app/kubectl /app/rungit.sh
RUN apt update
RUN apt -y install curl
RUN curl https://get.okteto.com -sSfL | sh

EXPOSE 80
CMD ["/app/configure.sh"]
