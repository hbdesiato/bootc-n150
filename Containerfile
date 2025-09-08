FROM quay.io/fedora/fedora-bootc:latest
RUN groupadd -r sudo && \
    useradd -m -G sudo core && \
    su core -c 'mkdir -m u=rwX,go= ~/.ssh' && \
    su core -c 'mkdir -m u=rwX,go= ~/.ssh/authorized_keys.d' && \
    dnf -y install NetworkManager-wifi realtek-firmware && \
    dnf clean all && \
  	rm -rf /var/cache/yum
COPY config/ /
