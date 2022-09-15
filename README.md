# RLCraft Docker Image

Dockerized version of the RLCraft modpack for Minecraft.

## Getting started

Build image

```bash
sudo docker build -t rlcraft:latest .
```

## Usage

Initial Start (First time running)

```bash
sudo docker run -d -v $(pwd)/data:/rlcraft -e EULA=true -p 25565:25565 --name rlcraft rlcraft:latest [extra options]
```
