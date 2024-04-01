FROM ubuntu:22.04
RUN apt-get update
RUN apt-get install -y curl jq
CMD ["/scripts/index-data.sh", "/collection-files"]