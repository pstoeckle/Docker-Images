FROM python:3.9-buster

RUN useradd --create-home --shell /bin/bash poetry_user
ENV HOME=/home/poetry_user
USER poetry_user
WORKDIR /home/poetry_user

RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python

ENV PATH="${HOME}/.poetry/bin:$PATH"
RUN poetry config virtualenvs.in-project true
