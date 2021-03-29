# Use the official image as a parent image.
FROM nginx
LABEL maintainer="Theniwo, https://github.com/theniwo"

# Set the working directory.
WORKDIR /root

# Run the command inside your image filesystem.

# Install packets
RUN DEBIAN_FRONTEND=noninteractive apt-get update &&\
  DEBIAN_FRONTEND=noninteractive apt-get install -y iputils-ping git curl netcat-openbsd coreutils &&\
  git clone https://github.com/bderenzo/tinystatus.git /root/tinystatus &&\
  DEBIAN_FRONTEND=noninteractive apt-get remove git -y &&\
  DEBIAN_FRONTEND=noninteractive apt-get autoremove -y &&\
  DEBIAN_FRONTEND=noninteractive apt-get clean &&\
  rm -rf /var/lib/apt/lists/* &&\
  rm -rf /var/cache/debconf/*

# Set Variables
ENV INTERVAL "10"

# Inform Docker that the container is listening on the specified port at runtime.
EXPOSE 80

# Run on startup
ENTRYPOINT /usr/sbin/service nginx restart && cd /root/tinystatus && while true; do /root/tinystatus/tinystatus > /usr/share/nginx/html/index.html && sleep $INTERVAL; done

# Run the specified command within the container.
#CMD ["/root/tinystatus > /usr/share/nginx/html/index.html"]
