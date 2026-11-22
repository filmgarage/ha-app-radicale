# Radicale CalDAV

This app runs [Radicale](https://radicale.org/), a CalDAV server, on Home Assistant.

## Configuration

| Option | Description |
|---|---|
| `username` | Username for CalDAV clients (for example Apple Calendar). |
| `password` | Password. Required; the app refuses to start without it. |

The password is stored as a bcrypt hash in `/data/htpasswd`.

## Connecting

Radicale listens on port 5232 inside the Home Assistant Docker network. This port is not opened to the outside.

Apple Calendar requires HTTPS. Use a reverse proxy app (for example Caddy) or Tailscale for this. Configure the proxy to forward to port 5232 on the internal app host.

## Storage

Calendars are stored in `/data/collections` and are included in the Home Assistant backup.

## Status

Experimental. Do not rely on this app as the only copy of important calendars without a backup.
