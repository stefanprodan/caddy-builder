package caddyhttp

import (
	// http.prometheus
	_ "github.com/miekg/caddy-prometheus"
	// http.ipfilter
	_ "github.com/pyed/ipfilter"
	// http.filemanager
	_ "github.com/hacdias/filemanager/caddy/filemanager"
	// http.hugo
	_ "github.com/hacdias/filemanager/caddy/hugo"
)
