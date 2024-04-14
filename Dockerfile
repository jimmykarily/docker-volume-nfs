FROM ubuntu:latest
MAINTAINER "Dimitris Karakasilis <dimitris@karakasilis.me>"

# Install nfs-utils
RUN apt update && apt install -y nfs-kernel-server nfs-common

# Copy entrypoint
ADD run_nfs.sh /usr/local/bin/run_nfs.sh

# Create exports dir
RUN mkdir -p /exports	\
 && chmod +x /usr/local/bin/run_nfs.sh

# Export NFS Ports
EXPOSE 20048/tcp 2049/tcp

# Expose volume
VOLUME /exports

# Launch entrypoint
ENTRYPOINT ["/usr/local/bin/run_nfs.sh"]

CMD ["/exports"]


