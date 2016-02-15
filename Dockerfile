FROM develar/java

MAINTAINER Leo Dutra <leodutra.br@gmail.com>

ENV SPIGOT_BUILDTOOLS_REV=latest \
    SPIGOT_PORT=25565 \
    SPIGOT_WORLDS_DIR=worlds \
    SPIGOT_JVM_OPTS='-server -Xmx2g -Xms1g' \
    SPIGOT_JVM_PROPERTIES='-Dcom.mojang.eula.agree=true -Djava.security.egd=file:/dev/urandom' \
    SPIGOT_CONFIG='--port ${SPIGOT_PORT} --world-dir ${SPIGOT_WORLDS_DIR}'


VOLUME ["/minecraft-server"]

RUN apk add --no-cache --virtual=build-dependencies curl bash git && \
    mkdir /tmp/minecraft-builder  && \
    cd /tmp/minecraft-builder && \
    curl -o BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar && \
    bash -c "java -jar BuildTools.jar --rev ${SPIGOT_BUILDTOOLS_REV}" && \
    mv spigot*.jar /spigot.jar && \
    echo "eula=true" > /minecraft-server/eula.txt && \
    apk del build-dependencies && \
    rm -rf /tmp/* /var/cache/apk/*

EXPOSE ${SPIGOT_PORT}

WORKDIR /minecraft-server

ENTRYPOINT sh -c "java ${SPIGOT_JVM_OPTS} ${SPIGOT_JVM_PROPERTIES} -jar /spigot.jar $(echo ${SPIGOT_CONFIG})"
