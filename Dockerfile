FROM alpine:3.22.1
WORKDIR /mc
RUN apk add --update \
    curl rcon-cli \
    && rm -rf /var/cache/apk/*

RUN curl -JLO "https://api.feed-the-beast.com/v1/modpacks/public/modpack/126/100095/server/linux" && chmod +x serverinstall_126_100095

RUN ./serverinstall_126_100095 -force -auto -accept-eula

ENTRYPOINT /mc/run.sh