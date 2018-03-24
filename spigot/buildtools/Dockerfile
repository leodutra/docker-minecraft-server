FROM anapsix/alpine-java:8

MAINTAINER Leo Dutra <leodutra.br@gmail.com>

ARG SPIGOT_REV=latest
ARG BUILD_TOOLS_JAR_URI="https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar"

ENV SERVER_PORT=25565 \
    JVM_OPTS='-server -Xmx2g -Xms1g' \
    JVM_PROPERTIES='-Dcom.mojang.eula.agree=true -Djava.security.egd=file:/dev/urandom'

VOLUME ["/srv/minecraft"]

RUN apk add --no-cache --virtual=build-dependencies curl bash git && \
    mkdir /tmp/srv-build  && \
    cd /tmp/srv-build && \
    curl -o BuildTools.jar ${BUILD_TOOLS_JAR_URI} && \
    bash -c "java -jar BuildTools.jar --rev ${SPIGOT_REV}" && \
    mv spigot*.jar /spigot.jar && \
    apk del build-dependencies && \
    rm -rf /tmp/srv-build /var/cache/apk/*

EXPOSE ${SERVER_PORT}

WORKDIR /srv/minecraft

ENTRYPOINT sh -c "java ${JVM_OPTS} ${JVM_PROPERTIES} -jar /spigot.jar --port ${SERVER_PORT} --world-dir worlds"
