# Home Assistant app repository: Radicale CalDAV

A Home Assistant app repository with one app: [Radicale](https://radicale.org/), a CalDAV server.

Purpose: make a calendar (for example a fire-service roster) available to Apple Calendar and other CalDAV clients, and to Home Assistant at the same time.

## Installation

1. In Home Assistant: **Settings → Apps → App store → ⋮ → Repositories**.
2. Add: `https://github.com/filmgarage/ha-app-radicale`
3. Install **Radicale CalDAV** and configure the options.

## Supported architectures

- aarch64 (Home Assistant Yellow, Green)
- amd64 (for example NUC)

## Status

This app has the `experimental` stage. It works, but may still change.

## Versioning

App versions follow [SemVer](https://semver.org/). The version is in `radicale/config.yaml` and in `radicale/CHANGELOG.md`.

## License

MIT. See [LICENSE](LICENSE).
