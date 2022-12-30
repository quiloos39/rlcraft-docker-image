FROM ibmjava:8-jre as builder

ARG FORGE_VERSION
ENV FORGE_VERSION=1.12.2-14.23.5.2860

ARG RLCRAFT_PACKAGE_URL
ENV RLCRAFT_PACKAGE_URL=https://mediafilez.forgecdn.net/files/3655/670/RLCraft+1.12.2+-+Release+v2.9.1c.zip
# ENV RLCRAFT_PACKAGE_URL=${RLCRAFT_PACKAGE_URL}

RUN apt-get update && \
    apt-get install -y curl unzip

RUN curl https://maven.minecraftforge.net/net/minecraftforge/forge/${FORGE_VERSION}/forge-${FORGE_VERSION}-installer.jar --output forge-installer.jar && \
    mkdir /rlcraft && \
    java -jar forge-installer.jar --installServer /rlcraft && \
    mv /rlcraft/forge-${FORGE_VERSION}.jar /rlcraft/forge.jar

RUN curl https://mediafiles.forgecdn.net/files/3655/676/RLCraft+Server+Pack+1.12.2+-+Release+v2.9.1c.zip --output rlcraft.zip && \
    unzip rlcraft.zip -d /rlcraft && \
    echo "eula=true" > /rlcraft/eula.txt

FROM ibmjava:8-jre

WORKDIR /rlcraft

COPY --from=builder /rlcraft .

EXPOSE 25565

CMD java -jar forge.jar nogui -Xmx32G -XX:+UseConcMarkSweepGC -XX:+CMSIncrementalMode -XX:-UseAdaptiveSizePolicy -Xmn128M



