FROM maildev/maildev:1.1.0

RUN apk add --update \
    gcc \
    make \
    g++ \
    python \
  && rm -rf /var/cache/apk/*

WORKDIR /usr/src/app

ENV NODE_ENV production

ENV NODE_TLS_REJECT_UNAUTHORIZED=0
RUN npm install node-gyp@5.0.5 -g && \
    npm install iconv@2.3.5 --save && \
    npm prune && \
    npm cache clean --force && \
    rm -rf /tmp/*