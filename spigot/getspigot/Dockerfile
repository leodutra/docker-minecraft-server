FROM develar/java

MAINTAINER Leo Dutra <leodutra.br@gmail.com>

ARG SPIGOT_JAR_URL="http://getspigot.org/jenkins/job/Spigot/lastSuccessfulBuild/artifact/spigot-1.9.2.jar"
ARG JVM_OPTS='-server -Xmx2g -Xms1g'

ENV SPIGOT_PORT=25565 \
    JVM_PROPERTIES='-Dcom.mojang.eula.agree=true -Djava.security.egd=file:/dev/urandom'

VOLUME ["/srv/minecraft"]

RUN apk add --no-cache --virtual=curl && \
    curl -o spigot.jar ${SPIGOT_JAR_URL} && \
    mv spigot.jar /spigot.jar && \
    apk del curl && \
    rm -rf /var/cache/apk/*

EXPOSE ${SPIGOT_PORT}

WORKDIR /srv/minecraft

ENTRYPOINT sh -c "java ${JVM_OPTS} ${JVM_PROPERTIES} -jar /spigot.jar --port ${SPIGOT_PORT} --world-dir worlds"
