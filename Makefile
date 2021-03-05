
update-upstream:
	./update.sh

build:
	kustomize build . > deploy.aio.yaml

apply: build
	kubectl apply -f deploy.aio.yaml
