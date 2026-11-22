#!/usr/bin/with-contenv bashio
# Radicale starten met gebruiker/wachtwoord uit de app-opties.
set -e

USERNAME="$(bashio::config 'username')"
PASSWORD="$(bashio::config 'password')"
DATA_DIR="/data"
HTPASSWD="${DATA_DIR}/htpasswd"

if [ -z "${PASSWORD}" ]; then
    bashio::exit.nok "Stel een wachtwoord in via de app-opties."
fi

# htpasswd met bcrypt, zonder externe tools (bcrypt zit al in de [bcrypt] extra).
python3 - "${USERNAME}" "${PASSWORD}" "${HTPASSWD}" <<'PY'
import sys, bcrypt
user, pw, path = sys.argv[1], sys.argv[2].encode(), sys.argv[3]
hashed = bcrypt.hashpw(pw, bcrypt.gensalt()).decode()
with open(path, "w") as f:
    f.write(f"{user}:{hashed}\n")
PY

mkdir -p /etc/radicale
cat > /etc/radicale/config <<CFG
[server]
hosts = 0.0.0.0:5232

[auth]
type = htpasswd
htpasswd_filename = ${HTPASSWD}
htpasswd_encryption = bcrypt

[storage]
filesystem_folder = ${DATA_DIR}/collections

[rights]
type = owner_only
CFG

bashio::log.info "Radicale start op poort 5232"
exec python3 -m radicale --config /etc/radicale/config
