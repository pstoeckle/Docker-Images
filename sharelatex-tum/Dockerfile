FROM ubuntu:lunar-20231128

ENV PATH="/home/python-sharelatex-user/.venv/bin/:${PATH}"

RUN apt-get update -qq  \
    && apt-get install -qqy --no-install-recommends python3 python3-pip git python3-venv \
    && apt-get autoremove -y -qq \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && useradd --create-home --shell /bin/bash python-sharelatex-user

WORKDIR /home/python-sharelatex-user
USER python-sharelatex-user

RUN python3 -m venv .venv \
    && pip install -qq --no-cache-dir --upgrade pip==21.3.1 \
    && git clone https://gitlab.inria.fr/sed-rennes/sharelatex/python-sharelatex

WORKDIR /home/python-sharelatex-user/python-sharelatex

RUN git checkout feature/sharelatextum \
    && pip install -e . \
    && git slatex

WORKDIR /home/python-sharelatex-user/
