
FROM alpine:3.12 as build

# to be set by upstream script
ARG VERSION=7.0.1

# install ghc
RUN apk add ghc libc-dev

# install stack
RUN wget -O - -q  https://get.haskellstack.org/ | sh

# download sources & build
RUN wget -O postgrest.tar.gz https://github.com/PostgREST/postgrest/archive/v${VERSION}.tar.gz && \
    tar xvzf postgrest.tar.gz && \
    cd postgrest-${VERSION} &&\
    # for reason for following link see: https://github.com/commercialhaskell/stack/blob/master/doc/faq.md#how-do-i-install-ghc-in-stack-when-it-fails-with-the-error-missing-ghc-bindist-for-linux64-ncurses6
    ln -s /usr/lib/libncursesw.so.6 /usr/lib/libtinfo.so.6 && \
    stack build


#
FROM alpine:3.12 as install


