FROM golang:1.15.6 AS build-env

RUN go version
ENV GOPATH=/

COPY ./ ./

# install psql
RUN apt-get update
RUN apt-get -y install postgresql-client
#RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends apt-utils
# make wait-for-postgres.sh executable

RUN chmod +x wait-for-postgres.sh
RUN go mod download
RUN go build -o snippet07 ./cmd/web


CMD ["./snippet07"]