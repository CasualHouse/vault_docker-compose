#!/bin/sh

# Установим параметры для подключения
HOST=postgres
PORT=5432
USER=${VAULT_POSTGRES_USER}
PASSWORD=${VAULT_POSTGRES_PASSWORD}
DB=${VAULT_POSTGRES_DB}

# Подключаемся к базе данных, пытаясь несколько раз
until nc -z -v -w30 $HOST $PORT; do
  echo "Ждем, пока PostgreSQL будет доступен на порту $PORT..."
  sleep 2
done

# Выполняем SQL-скрипт для создания таблиц
echo "PostgreSQL доступен, создаем таблицы..."
PGPASSWORD=$PASSWORD psql -h $HOST -U $USER -d $DB -f /scripts/create_vault_tables.sql

echo "Таблицы успешно созданы или уже существуют."
