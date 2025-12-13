FROM mcr.microsoft.com/devcontainers/dotnet:8.0

RUN apt-get update \
    && apt-get install -y git-lfs \
    && git lfs install

WORKDIR /workspace
