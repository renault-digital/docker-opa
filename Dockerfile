FROM alpine:3

# variable "VERSION" must be passed as docker environment variables during the image build
# docker build --no-cache --build-arg HELM_VERSION=3.2.1 --build-arg YQ_VERSION=3.3.0 -t renaultdigital/helm:2.12.0 .

ARG OPA_VERSION=v0.23.1


ENV OPA_SOURCE="https://openpolicyagent.org/downloads/${OPA_VERSION}/opa_linux_amd64"

RUN apk add --update --no-cache git curl ca-certificates && rm -f /var/cache/apk/* && \
    curl -L ${OPA_SOURCE} --output /usr/bin/opa && \
    chmod +x /usr/bin/opa && \
    adduser opa -u 1001 -D

WORKDIR /apps

USER opa

ENTRYPOINT ["opa"]
CMD ["--help"]
