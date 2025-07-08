## Running the Project Locally

1. **Start the backend and database**:

```bash
docker compose up --build
```
2. **Start the Frontend**:

```bash
npm install
npm run dev
```

### Or using nix:

#### With direnv:
```
direnv allow
devenv up
```

#### Without direnv

```
nix develop --no-pure-eval
devenv up
```
