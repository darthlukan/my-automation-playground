VERSION := v0.0.2

.PHONY: all
all: lint container

.PHONY: lint
lint:
	ansible-lint .

.PHONY: container
container:
	podman build -f ./Containerfile -t quay.io/btomlins/ansible-playbook:$(VERSION)
	podman tag quay.io/btomlins/ansible-playbook:$(VERSION) quay.io/btomlins/ansible-playbook:latest
	podman push quay.io/btomlins/ansible-playbook:$(VERSION)
	podman push quay.io/btomlins/ansible-playbook:latest
