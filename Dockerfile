# 1. Using Ubuntu version 18.04 as the base image
FROM ubuntu:18.04

# 2. Setting the maintainer label
LABEL maintainer="Ayus Mukherjee"

# 3. Creating an argument for the host user
ARG HOST_USER=Ayus

# 4. Setting environment variables
ENV HOME /home/$HOST_USER

# 5. Copying requirement files into the container filesystem
COPY pip_requirements.txt conda_requirements.txt $HOME/

# 6. Creating a new user and setting up the environment
RUN useradd -ms /bin/bash $HOST_USER \
    && chown -R $HOST_USER:$HOST_USER $HOME

# 7. Switching to the created user
USER $HOST_USER



# 8. Setting the working directory
WORKDIR $HOME



# 10. Setting the default command to /bin/bash
CMD ["/bin/bash"]
