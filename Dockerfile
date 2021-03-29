# Use the official image as a parent image.
FROM nginx

# Set the working directory.
WORKDIR /root


# Run the command inside your image filesystem.

# Install packets
RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y apt-utils
RUN DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -y
RUN DEBIAN_FRONTEND=noninteractive apt-get clean
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y iputils-ping git curl netcat-openbsd coreutils
RUN git clone https://github.com/bderenzo/tinystatus.git /root/tinystatus


# Set Variables
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile


#Final update
RUN apt-get remove git -y
RUN apt-get autoremove -y
RUN chmod +x /root/tinystatus
RUN touch /usr/share/nginx/html/index.html

# Copy the file from your host to your current location. (This has to be done as the last step before running CMD or ENTRYPOINT)
COPY ./content /

# Inform Docker that the container is listening on the specified port at runtime.
EXPOSE 80

# Run on startup
ENTRYPOINT /usr/sbin/service nginx restart && cd /root/tinystatus && while true; do /root/tinystatus/tinystatus > /usr/share/nginx/html/index.html && sleep 10; done

# Run the specified command within the container.
#CMD ["/root/tinystatus > /usr/share/nginx/html/index.html"]
