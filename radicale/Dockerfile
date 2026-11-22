ARG BUILD_FROM
FROM ${BUILD_FROM}

# Radicale is pure Python with no architecture-specific binaries,
# so the same build works on aarch64 (Yellow, Green) and amd64 (NUC).
ARG RADICALE_VERSION=3.6.1
RUN pip install --no-cache-dir "radicale[bcrypt]==${RADICALE_VERSION}"

COPY run.sh /run.sh
RUN chmod a+x /run.sh

CMD ["/run.sh"]
