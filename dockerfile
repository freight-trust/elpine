FROM alpine:3.11

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="Freight Trust Containers" \
      org.label-schema.description="Secure Build" \
      org.label-schema.url="https://docker.freighttrust.com/" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/freight-trust/action-docker.git" \
      org.label-schema.vendor="Freight Trust & Clearing" \
      org.label-schema.version=$VERSION \
      org.label-schema.schema-version="1.0"
      
RUN echo http://dl-cdn.alpinelinux.org/alpine/v3.11/main > /etc/apk/repositories; \
    echo http://dl-cdn.alpinelinux.org/alpine/v3.11/community >> /etc/apk/repositories
 
RUN \
    apk add --no-cache bash git curl jq xmllint libxslt libxml2-utils && \
    mkdir -p /tmp/work && \
    mkdir -p /opt/scripts

RUN apk add xmlstarlet --update --repository http://dl-4.alpinelinux.org/alpine/edge/testing \
	&& rm -rf /var/cache/apk/*

COPY scripts/*.sh /opt/scripts/

WORKDIR /tmp/work

ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

ENTRYPOINT ["bash",  "/opt/scripts/wrapper.sh"]
