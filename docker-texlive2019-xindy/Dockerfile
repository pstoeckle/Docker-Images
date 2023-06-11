FROM raabf/latex-versions:texlive2019

LABEL author="Patrick Stöckle <patrick.stoeckle@posteo.de>"

RUN apt-get update -qq \
    && apt-get upgrade -y\
    && apt-get install -qq --no-install-recommends -y xindy=2.5.1.20160104-8 git-lfs=2.9.2-1 \
    && rm -rf /var/lib/apt/lists/* \
    && useradd --create-home --shell /bin/bash latex-user

WORKDIR /home/latex-user
USER latex-user
