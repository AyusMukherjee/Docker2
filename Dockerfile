FROM ubuntu:18.04

LABEL maintainer="Ayus Mukherjee"

ARG HOST_USER

COPY pip_requirements.txt conda_requirements.txt $HOME/

USER $HOST_USER

WORKDIR $HOME

RUN conda install --yes --file conda_requirements.txt && rm conda_requirements.txt \
    && pip install --user -r pip_requirements.txt --no-cache-dir && rm pip_requirements.txt

CMD /bin/bash
