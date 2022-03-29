FROM registry.access.redhat.com/ubi8-minimal:latest

LABEL maintainer.name="Brian Tomlinson" \
      maintainer.email="darthlukan@gmail.com" \
      license="GPLv3" \
      license.url="https://www.gnu.org/licenses/gpl-3.0.txt" \
      description="Ansible in a container"

RUN microdnf update -y && \
    microdnf upgrade -y && \
    microdnf install python3-pip python3-cryptography git -y && \
    microdnf clean all -y && \
    /usr/bin/pip3 install ansible

RUN useradd -U -u 1001 -m notroot

USER notroot

ENTRYPOINT ["/usr/local/bin/ansible-playbook"]
CMD ["--version"]
