# 1. Use Ubuntu version 18.04 as the base image
FROM ubuntu:18.04

# 2. Set the maintainer label
LABEL maintainer="Ayus Mukherjee"

# 3. Create an argument for the host user
ARG HOST_USER=Ayus

# 4. Set environment variables
ENV HOME /home/$HOST_USER

# 5. Copy requirement files into the container filesystem
COPY pip_requirements.txt conda_requirements.txt $HOME/

# 6. Create a new user and set up the environment
RUN useradd -ms /bin/bash $HOST_USER \
    && chown -R $HOST_USER:$HOST_USER $HOME

# 7. Switch to the created user
USER $HOST_USER

RUN pip install --user -r pip_requirements.txt --no-cache-dir \
    && rm pip_requirements.txt

# 8. Set the working directory
WORKDIR $HOME



# 10. Set the default command to /bin/bash
CMD ["/bin/bash"]
