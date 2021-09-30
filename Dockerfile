FROM debian:11 as preprod

ENV PYTHON_VERSION="3.9.7"
ENV WORKPATH="/project/"

RUN apt update && apt install -y curl && \
    curl -LO http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    bash Miniconda3-latest-Linux-x86_64.sh -p /miniconda -b && \
    rm Miniconda3-latest-Linux-x86_64.sh 

ENV PATH=/miniconda/bin:${PATH}

RUN conda update -y conda && \
    conda install -c anaconda -y python=${PYTHON_VERSION} && \
    conda install -c anaconda -y pip && \
    mkdir ${WORKPATH}

COPY ./project/* ${WORKPATH}
RUN pip install -r ${WORKPATH}/requirements.txt
WORKDIR ${WORKPATH}
CMD ["python", "main.py"]