FROM maildev/maildev:2.0.5

USER root

RUN apk add --update \
    gcc \
    make \
    g++ \
    python3 \
  && rm -rf /var/cache/apk/*

WORKDIR /home/node

ENV NODE_ENV production

ENV NODE_TLS_REJECT_UNAUTHORIZED=0
RUN npm install node-gyp@8.4.1 -g && \
    npm install iconv@3.0.1 --save && \
    npm prune && \
    npm cache clean --force && \
    rm -rf /tmp/*