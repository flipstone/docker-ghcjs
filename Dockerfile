FROM haskell:7.10.3

ENV GHCJS_VERSION master-20160209

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      curl \
      nodejs \
      nodejs-legacy \
      && \
    apt-get clean

RUN curl -o /$GHCJS_VERSION.tar.gz http://ghcjs.luite.com/$GHCJS_VERSION.tar.gz && \
    cabal update && \
    cabal install /$GHCJS_VERSION.tar.gz && \
    rm /$GHCJS_VERSION.tar.gz

ENV PATH /root/.cabal/bin:$PATH
RUN ghcjs-boot

