FROM ubuntu:18.04

# Step 2: 
LABEL maintainer="Ayus Mukherjee"

# Step 3: 
ARG HOST_USER=Ayus

# Step 4: 


# Step 5: 
COPY pip_requirements.txt conda_requirements.txt $HOME/

# Step 6: 
USER $HOST_USER

# Step 7: 
WORKDIR $HOME

RUN conda install --yes --file conda_requirements.txt && rm conda_requirements.txt \
    && pip install --user -r pip_requirements.txt --no-cache-dir && rm pip_requirements.txt

# Step 10: 
CMD ["/bin/bash"]
