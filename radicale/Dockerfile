ARG BUILD_FROM
FROM ${BUILD_FROM}

# Radicale draait als pure Python: geen architectuur-specifieke binaries,
# dus dezelfde build werkt op aarch64 (Yellow, Green) en amd64 (NUC).
ARG RADICALE_VERSION=3.6.1
RUN pip install --no-cache-dir "radicale[bcrypt]==${RADICALE_VERSION}"

COPY run.sh /run.sh
RUN chmod a+x /run.sh

CMD ["/run.sh"]
