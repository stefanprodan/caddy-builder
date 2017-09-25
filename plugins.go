package caddyhttp

import (
	// http.prometheus
	_ "github.com/miekg/caddy-prometheus"
	// http.filemanager
	_ "github.com/hacdias/filemanager/caddy/filemanager"
	// http.hugo
	_ "github.com/hacdias/filemanager/caddy/hugo"
)
