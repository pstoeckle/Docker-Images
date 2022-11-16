FROM python:3.9-bullseye

LABEL author="Patrick Stöckle <patrick.stoeckle@posteo.de>"

ENV HOME=/home/poetry_user
ENV PATH="${PATH}:${HOME}/.poetry/bin:/home/poetry_user/.local/bin"

RUN apt-get update -qq \
    && apt-get autoremove -y -qq \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && pip install --no-cache-dir --upgrade pip==22.3.1 \
    && useradd --create-home --shell /bin/bash poetry_user

WORKDIR /home/poetry_user
USER poetry_user

COPY install.py install.py

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN python install.py --version 1.2.1 \
    && rm install.py \
    && poetry config virtualenvs.in-project true
