FROM python:3.7 
LABEL maintainer="Brendan"
RUN apt-get update
RUN apt-get install -y --no-install-recommends apt-utils
RUN apt-get -y update && \
    apt-get -y install graphviz 

RUN pip3 install jupyterlab 

RUN mkdir -p /scripts
ADD ./jupyter/run_jupyter.sh /scripts/
ADD ./jupyter/jupyter_notebook_config.py /root/.jupyter/
ADD ./jupyter/custom.css /root/.jupyter/custom/
RUN chmod -R a+x /scripts
ENTRYPOINT ["/scripts/run_jupyter.sh"]
