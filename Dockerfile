FROM hashicorp/vault:latest

# Устанавливаем необходимые утилиты
RUN apk add --no-cache gettext netcat-openbsd postgresql-client

# Копируем скрипты в контейнер
COPY ./scripts /scripts

COPY ./vault-config /vault/config

# Делаем скрипты исполняемыми
RUN chmod -R +x /scripts

# Запускаем Vault с использованием шаблона
CMD /bin/sh -c '/scripts/wait-for-postgres.sh && envsubst < /vault/config/vault.hcl.template > /vault/config/vault.hcl && vault server -config=/vault/config/vault.hcl'
