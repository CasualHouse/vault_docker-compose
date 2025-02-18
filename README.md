# Vault Docker Setup

## Simple way to run Vault with settings from `.env`

### Steps:

1. Create a `.env` file in the root of your project and add the necessary variables:

    ```bash
    VAULT_POSTGRES_USER=<your_user>
    VAULT_POSTGRES_PASSWORD=<your_password>
    VAULT_POSTGRES_DB=<your_db>

    VAULT_ADDR=<vault_address>
    VAULT_API_ADDR=<vault_api_address>

    TLS_DISABLE=true
    DISABLE_MLOCK=true
    UI_ENABLED=true
    ```

2. To start Vault, run the following command:

    ```bash
    docker-compose up -d --build
    ```

3. Once the container is running, access the Vault container:

    ```bash
    docker exec -it vault /bin/sh
    ```

4. Inside the container, initialize Vault by running:

    ```bash
    vault operator init
    ```

   This will initialize Vault and generate the unseal keys and the root token. Make sure to save them in a secure place.

---

That’s all you need to run Vault with settings from `.env` and initialize it inside the container.
