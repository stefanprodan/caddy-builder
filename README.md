# caddy-builder

Build Caddy with plugins from source using Docker multi-build

Build Caddy image:

```bash
docker build -t stefanprodan/caddy .
```

Run Caddy container:

```bash
 docker run -d -p 80:80 -p 443:443 -p 9180:9180 --name caddy stefanprodan/caddy
```

### Compose

Build image:

```bash
CADDY_VERSION=0.10.9 docker-compose build caddy
```

Deploy container:

```bash
docker-compose up -d
```

Remove container, volumes and image:

```bash
docker-compose down -v --rmi all
```
