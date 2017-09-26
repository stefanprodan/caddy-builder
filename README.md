# caddy-builder

Build Caddy with plugins from source using Docker multi-build

Build the image with Docker Compose:

```bash
CADDY_VERSION=0.10.9 docker-compose build caddy
```

Run Caddy container exposing 80, 443 and 9180 ports:

```bash
docker-compose up -d
```

Remove container, volumes and image:

```bash
docker-compose down -v --rmi all
```

