FROM debian:9-slim

WORKDIR /tmp/rustapp
COPY . .

RUN echo deb http://ftp.debian.org/debian stretch-backports main >> /etc/apt/sources.list \
 && apt-get update \
 && apt-get install -y curl file sudo gcc libsodium18 libsodium-dev clang-5.0 pkg-config make libssl-dev liblzma-dev \
 && curl -f -L https://static.rust-lang.org/rustup.sh -O \
 && /bin/bash rustup.sh --channel=nightly --date=2018-09-26 \
 && cargo build \
 && /bin/bash rustup.sh --channel=nightly --uninstall

ENTRYPOINT ["/bin/bash"]
