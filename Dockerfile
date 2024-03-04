FROM public.ecr.aws/docker/library/golang:1.22.0-alpine3.19

RUN go install github.com/google/go-jsonnet/cmd/jsonnet@v0.20.0 && \
    go install github.com/jsonnet-bundler/jsonnet-bundler/cmd/jb@v0.5.1

RUN addgroup -S argocd && \
    adduser -u 999 -S argocd -G argocd -h /home/argocd

WORKDIR /home/argocd

USER argocd

COPY --chown=argocd plugin.yaml cmp-server/config/plugin.yaml
