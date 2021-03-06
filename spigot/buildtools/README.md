## Spigot Minecraft Server on Alpine Linux 3 and Oracle JRE 8

# ![Docker logo][docker-logo] + ![Alpine Linux logo][alpine-logo] + ![Spigot logo][spigot-logo]

###### 235 MB

### Running  
```sh
docker run -itd -v /srv/minecraft:/srv/minecraft -p 25565:25565 leodutra/docker-minecraft-server
```

### Building specific Spigot server revisions
```sh
wget https://raw.githubusercontent.com/leodutra/docker-minecraft-server/master/Dockerfile
docker build --build-arg SPIGOT_REV=1.9 .
docker run -itd -v /srv/minecraft:/srv/minecraft -p 25565:25565 <IMAGE ID> 
```

[docker-logo]: https://raw.githubusercontent.com/leodutra/docker-minecraft-server/master/imgs/docker-logo.png "Made with Docker"
[alpine-logo]: https://raw.githubusercontent.com/leodutra/docker-minecraft-server/master/imgs/alpine-logo.png "Made with Alpine Linux" 
[spigot-logo]: https://raw.githubusercontent.com/leodutra/docker-minecraft-server/master/imgs/spigot-logo.png "Made with Spigot Minecraft Server"
