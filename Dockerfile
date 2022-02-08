FROM python:3.9-bullseye

ARG COMMIT=""
ARG COMMIT_SHORT=""
ARG BRANCH=""
ARG TAG=""

LABEL author="Patrick Stöckle <patrick.stoeckle@tum.de>"
LABEL edu.tum.i4.docker-images.commit=${COMMIT}
LABEL edu.tum.i4.docker-images.commit-short=${COMMIT_SHORT}
LABEL edu.tum.i4.docker-images.branch=${BRANCH}
LABEL edu.tum.i4.docker-images.tag=${TAG}

ENV COMMIT=${COMMIT}
ENV COMMIT_SHORT=${COMMIT_SHORT}
ENV BRANCH=${BRANCH}
ENV TAG=${TAG}

RUN apt-get update -qq \
    && apt-get autoremove -y -qq \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && pip install --no-cache-dir --upgrade pip==21.3.1 \
    && useradd --create-home --shell /bin/bash poetry_user

WORKDIR /home/poetry_user
ENV HOME=/home/poetry_user
USER poetry_user

COPY rsc/get-poetry.py get-poetry.py

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN python get-poetry.py && rm get-poetry.py

ENV PATH="${HOME}/.poetry/bin:$PATH"
RUN poetry config virtualenvs.in-project true
