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
