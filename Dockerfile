FROM develar/java

MAINTAINER Leo Dutra <leodutra.br@gmail.com>

ARG SPIGOT_REV=latest

ENV SPIGOT_PORT=25565 \
    JVM_OPTS='-server -Xmx2g -Xms1g' \
    JVM_PROPERTIES='-Dcom.mojang.eula.agree=true -Djava.security.egd=file:/dev/urandom'

VOLUME ["/srv/minecraft"]

RUN apk add --no-cache --virtual=build-dependencies curl bash git && \
    mkdir /tmp/minecraft-builder  && \
    cd /tmp/minecraft-builder && \
    curl -o BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar && \
    bash -c "java -jar BuildTools.jar --rev ${SPIGOT_REV}" && \
    mv spigot*.jar /spigot.jar && \
    apk del build-dependencies && \
    rm -rf /tmp/* /var/cache/apk/*

EXPOSE ${SPIGOT_PORT}

WORKDIR /srv/minecraft

ENTRYPOINT sh -c "java ${JVM_OPTS} ${JVM_PROPERTIES} -jar /spigot.jar --port ${SPIGOT_PORT} --world-dir worlds"
