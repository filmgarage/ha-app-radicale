# Radicale CalDAV

Deze app draait [Radicale](https://radicale.org/), een CalDAV-server, op Home Assistant.

## Configuratie

| Optie | Beschrijving |
|---|---|
| `username` | Gebruikersnaam voor CalDAV-clients (bijv. Apple Calendar). |
| `password` | Wachtwoord. Verplicht; de app weigert te starten zonder. |

Het wachtwoord wordt als bcrypt-hash opgeslagen in `/data/htpasswd`.

## Verbinden

Radicale luistert op poort 5232 binnen het Docker-netwerk van Home Assistant. Deze poort is niet naar buiten opengezet.

Apple Calendar vereist HTTPS. Gebruik daarvoor een reverse proxy-app (bijv. Caddy) of Tailscale. Stel daar de proxy in naar de interne app-host op poort 5232.

## Opslag

Agenda's staan in `/data/collections` en worden meegenomen in de Home Assistant-backup.

## Status

Experimenteel. Gebruik de app niet als enige kopie van belangrijke agenda's zonder backup.
