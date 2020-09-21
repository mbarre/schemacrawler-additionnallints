FROM schemacrawler/schemacrawler

ARG LINTS_VERSION=*

USER schcrwlr
WORKDIR /home/schcrwlr

LABEL \
  "io.github.mbarre.product-version"="SchemaCrawler Additional Lints ${LINTS_VERSION}" \
  "io.github.mbarre.website"="http://mbarre.github.io/schemacrawler-additional-lints/" \
  "io.github.mbarre.docker-hub"="https://hub.docker.com/r/mbarre/schemacrawler-additional-lints"

MAINTAINER Michèle Barré <michele.barre@gmail.com>

USER root
RUN addgroup schcrwlr

RUN ls

# Copy additional-lints local jar file
COPY --chown=schcrwlr:schcrwlr target/schemacrawler-additional-lints-*.jar /opt/schemacrawler/lib/
RUN chmod +rx /opt/schemacrawler/lib/*.jar

# Create aliases for SchemaCrawler
RUN chmod +rx /opt/schemacrawler/schemacrawler.sh
USER schcrwlr
RUN echo 'alias schemacrawler="/opt/schemacrawler/schemacrawler.sh"' >> /home/schcrwlr/.bashrc

