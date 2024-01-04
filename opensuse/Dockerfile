# Set the base image
ARG BASE_IMAGE_RELEASE_TYPE_AND_TAG=${BASE_IMAGE_RELEASE_TYPE_AND_TAG}
FROM opensuse/${BASE_IMAGE_RELEASE_TYPE_AND_TAG}

# Set ARG
ARG TZ=Asia/Tokyo
ARG USER_NAME=${USER_NAME}

# Set TimeZone
RUN ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone

# Repository Update
RUN zypper --non-interactive update

# Install Packages
RUN zypper install -y git &&\
    zypper install -y shadow &&\
    zypper install -y sudo &&\
    zypper install -y tar &&\
    zypper install -y unzip

# Add User
RUN useradd ${USER_NAME} --badname

# Setup to use sudo without password
RUN echo "${USER_NAME} ALL=NOPASSWD: ALL" >> /etc/sudoers

# Setup WORKDIR
WORKDIR /home/${USER_NAME}
