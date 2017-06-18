FROM alpine:3.5
RUN apk add --no-cache py2-pip
# there is an aws-cli package in testing - once it's in a stable alpine
# release it might make sense to switch to that
RUN pip install awscli
COPY sync.sh /sync.sh
COPY pre-fetch.sh /pre-fetch.sh
