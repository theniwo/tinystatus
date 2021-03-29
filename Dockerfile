# Use the official image as a parent image.
FROM nginx
LABEL maintainer="Theniwo, https://github.com/theniwo"

# Set the working directory.
WORKDIR /root

# Run the command inside your image filesystem.

# Install packets
RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y apt-utils
RUN DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y iputils-ping git curl netcat-openbsd coreutils
RUN git clone https://github.com/bderenzo/tinystatus.git /root/tinystatus

# Set Variables
ENV INTERVAL "10"

#Final update
RUN DEBIAN_FRONTEND=noninteractive apt-get remove git -y
RUN DEBIAN_FRONTEND=noninteractive apt-get autoremove -y
RUN DEBIAN_FRONTEND=noninteractive apt-get clean

# Inform Docker that the container is listening on the specified port at runtime.
EXPOSE 80

# Run on startup
ENTRYPOINT /usr/sbin/service nginx restart && cd /root/tinystatus && while true; do /root/tinystatus/tinystatus > /usr/share/nginx/html/index.html && sleep $INTERVAL; done

# Run the specified command within the container.
#CMD ["/root/tinystatus > /usr/share/nginx/html/index.html"]
