# Definir a imagem base como Python 3.12-slim
FROM python:3.12-slim as python-base

# Definir variáveis de ambiente para Python e Poetry
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100 \
    POETRY_VERSION=1.0.3 \
    POETRY_HOME="/opt/poetry" \
    POETRY_VIRTUALENVS_IN_PROJECT=true \
    POETRY_NO_INTERACTION=1 \
    PYSETUP_PATH="/opt/pysetup" \
    VENV_PATH="/opt/pysetup/.venv"

# Adicionar Poetry e venv ao PATH
ENV PATH="$POETRY_HOME/bin:$VENV_PATH/bin:$PATH"

# Instalar dependências do sistema e Poetry
RUN apt-get update \
    && apt-get install --no-install-recommends -y curl build-essential libpq-dev gcc \
    && curl -sSL https://install.python-poetry.org | python3 - \
    && rm -rf /var/lib/apt/lists/*

# Configurar diretório de trabalho
WORKDIR $PYSETUP_PATH

# Copiar arquivos de configuração do Poetry
COPY poetry.lock pyproject.toml ./


# Copiar o código da aplicação
COPY . /app/

# Definir o diretório de trabalho para a aplicação
WORKDIR /app

# Expor a porta 8000
EXPOSE 8000

# Comando de inicialização
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]