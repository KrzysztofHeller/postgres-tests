# postgres-tests

Środowisko testowe PostgreSQL z dostępem przez tunel SSH (Docker Compose).

## Struktura

```
├── docker-compose.yml    # Definicja serwisów PostgreSQL i SSH
├── ssh/Dockerfile        # Obraz kontenera SSH (Alpine + OpenSSH)
└── init/01-init.sql      # Skrypt inicjalizujący bazę danych
```

## Wymagania

- Docker + Docker Compose

## Uruchomienie

```bash
docker compose up -d
```

## Połączenie z bazą danych

### Bezpośrednio (bez proxy)

```bash
psql -h 127.0.0.1 -p 5433 -U testuser devdb
```

Hasło: `rootpass`

### Przez tunel SSH

#### 1. Otwórz tunel SSH (terminal 1)

```bash
ssh -L 5432:postgres:5432 tunnel@192.168.10.226 -p 2223
```

Hasło: `tunnel`

#### 2. Połącz się przez tunel (terminal 2)

```bash
psql -h 127.0.0.1 -U testuser devdb
```

Hasło: `rootpass`

## Dane dostępowe

| Parametr        | Wartość      |
|-----------------|-------------|
| Host PostgreSQL | `postgres` (wewnątrz sieci Docker) |
| Port PostgreSQL | `5432` (wewnętrzny) / `5433` (bezpośredni) |
| Baza danych     | `devdb`     |
| Użytkownik      | `testuser`  |
| Hasło           | `rootpass`  |
| SSH user        | `tunnel`    |
| SSH hasło       | `tunnel`    |
| SSH port        | `2222`      |

## Inicjalizacja bazy

Przy pierwszym uruchomieniu automatycznie tworzona jest tabela `testowa` z przykładowymi danymi (skrypt `init/01-init.sql`).
