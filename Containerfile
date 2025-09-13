ARG BASE_VERSION=:latest
FROM quay.io/fedora/fedora-bootc$BASE_VERSION
RUN groupadd -r sudo && \
    useradd -m -G sudo core && \
    su core -c 'mkdir -m u=rwX,go= ~/.ssh' && \
    su core -c 'mkdir -m u=rwX,go= ~/.ssh/authorized_keys.d' && \
    rpm -q --qf="%{NAME}\n" -a > /tmp/packages.txt && \
    dnf -y install NetworkManager-wifi dnsmasq && \
    rpm -q --qf="%{NAME}\n" -a >> /tmp/packages.txt && \
    cat /tmp/packages.txt | sort | uniq -u > /usr/share/misc/additional_packages.txt && \
    rm -f /tmp/packages.txt && \
    dnf clean all && \
  	rm -rf /var/cache/yum
COPY config/ /
