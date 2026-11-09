# Ollama com Open WebUI

## Iniciar

Requer Docker Desktop com o Compose habilitado.

```sh
docker compose up -d
```

Abra o Open WebUI em <http://localhost:3000>. Depois que o Ollama estiver ativo, baixe um modelo com:

```sh
docker compose exec ollama ollama pull llama3.2
```

Os modelos ficam no volume `ollama` e continuam disponiveis depois que os containers forem recriados. Para acompanhar a inicializacao:

```sh
docker compose logs -f ollama
```

Para parar os servicos, execute `docker compose down`. Evite `docker compose down -v` se quiser preservar os modelos e os dados do Open WebUI.
