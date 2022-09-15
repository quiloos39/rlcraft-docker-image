#!/bin/sh
echo "Setting RLCraft Files"
echo "Checking for previous installation"
if [ -z "$(ls -A /rlcraft)" ]; then
    echo "Installing Forge Server"
    java -jar /root/forge-${FORGE_VERSION}-installer.jar --installServer && \
    echo "Unpacking RLCraft Server"
    unzip /root/rlcraft.zip -d /rlcraft
    EULA="${EULA:=false}"
    echo "eula=$EULA" > /rlcraft/eula.txt
fi

echo "Starting RLCraft Server"
java -jar forge-${FORGE_VERSION}.jar nogui $@
