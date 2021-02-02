FROM alpine:3

# variable "VERSION" must be passed as docker environment variables during the image build
# docker build --no-cache --build-arg HELM_VERSION=3.2.1 --build-arg YQ_VERSION=3.3.0 -t renaultdigital/helm:2.12.0 .

ARG OPA_VERSION=v0.26.0
ARG OPA_IMAGE_TYPE=opa_linux_amd64

ENV OPA_SOURCE="https://github.com/open-policy-agent/opa/releases/download/${OPA_VERSION}/${OPA_IMAGE_TYPE}"

RUN apk add --update --no-cache git ca-certificates && rm -f /var/cache/apk/* && \
    adduser opa -u 1001 -D

ADD ${OPA_SOURCE} /usr/bin/opa

RUN chmod +x /usr/bin/opa

WORKDIR /apps

USER opa

ENTRYPOINT ["opa"]
CMD ["--help"]
