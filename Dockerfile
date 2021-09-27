FROM debian:11

RUN apt update && apt install -y curl && \
    curl -LO http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    bash Miniconda3-latest-Linux-x86_64.sh -p /miniconda -b && \
    rm Miniconda3-latest-Linux-x86_64.sh 

ENV PATH=/miniconda/bin:${PATH}

RUN conda update -y conda && \
    conda install -c anaconda -y python=3.9.7 && \
    conda install -c anaconda -y pip && \
    mkdir project

COPY ./project/* project/
RUN pip install -r /project/requirements.txt
WORKDIR /project
CMD python main.py