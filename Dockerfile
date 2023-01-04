FROM opensuse/tumbleweed:latest

# Execution user name after container startup
ARG USER_NAME

# Repository Update
RUN zypper update

# Install shadow
RUN zypper install -y shadow

# Install sudo
RUN zypper install -y sudo

# Install tar
RUN zypper install -y tar

# Install git
RUN zypper install -y git

# User add
RUN useradd ${USER_NAME} --badname

# Setup to use sudo without password
RUN echo "${USER_NAME} ALL=NOPASSWD: ALL" | tee /etc/sudoers

ENTRYPOINT tail -f /dev/null