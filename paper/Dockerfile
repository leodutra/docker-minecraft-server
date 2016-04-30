FROM develar/java

MAINTAINER Leo Dutra <leodutra.br@gmail.com>

ARG JVM_OPTS='-server -Xmx2g -Xms1g'

ENV SERVER_PORT=25565 \
    JVM_PROPERTIES='-Dcom.mojang.eula.agree=true -Djava.security.egd=file:/dev/urandom'

VOLUME ["/srv/minecraft"]

RUN apk add --no-cache --virtual=curl && \
    curl -o paper.jar 'https://ci.destroystokyo.com/job/PaperSpigot/lastSuccessfulBuild/artifact/paperclip.jar' && \
    mv paper.jar /paper.jar && \
    apk del curl && \
    rm -rf /var/cache/apk/*

EXPOSE ${SERVER_PORT}

WORKDIR /srv/minecraft

ENTRYPOINT sh -c "java ${JVM_OPTS} ${JVM_PROPERTIES} -jar /paper.jar --port ${SERVER_PORT} --world-dir worlds"
