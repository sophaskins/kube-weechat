FROM alpine:3.5
RUN apk add --no-cache weechat weechat-python weechat-perl
ADD https://weechat.org/files/scripts/buffers.pl /weechat/perl/autoload/buffers.pl
ADD https://weechat.org/files/scripts/autosort.py /weechat/python/autoload/autosort.py
ENTRYPOINT ["/usr/bin/weechat"]
