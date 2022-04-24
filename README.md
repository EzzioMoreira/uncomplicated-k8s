# Uncomplicated Kubernetes

### Requisitos
- Docker
- VirtualBox
- Minikube

```shell
docker run -it --rm -v $$PWD:/app -w /app/ --entrypoint "" hashicorp/terraform:latest sh
```
docker run -it --rm -v $$PWD:/app -w /app/ --entrypoint "" hashicorp/terraform:$(TERRAFORM_VERSION) sh
