FROM ibmjava:8-jre

ENV FORGE_VERSION=1.12.2-14.23.5.2860
VOLUME /rlcraft
WORKDIR /rlcraft

RUN apt-get update && \
    apt-get install -y curl unzip && \
    rm -rf /var/lib/apt/lists/* && \
    cd /root && \
    curl --remote-name https://maven.minecraftforge.net/net/minecraftforge/forge/${FORGE_VERSION}/forge-${FORGE_VERSION}-installer.jar && \
    curl https://mediafiles.forgecdn.net/files/3655/676/RLCraft+Server+Pack+1.12.2+-+Release+v2.9.1c.zip --output rlcraft.zip

EXPOSE 25565

COPY entrypoint.sh /root/entrypoint.sh
CMD "-Xmx4G -XX:+UseConcMarkSweepGC -XX:+CMSIncrementalMode -XX:-UseAdaptiveSizePolicy -Xmn128M"
ENTRYPOINT /root/entrypoint.sh



