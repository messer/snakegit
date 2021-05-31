FROM python:3-slim AS builder
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y git curl ninja-build rsync
RUN apt-get clean
RUN useradd -m snake
USER snake
ENV PATH /home/snake/.local/bin:/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN pip install twine

FROM builder
WORKDIR /build

