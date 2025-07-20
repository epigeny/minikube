service=opal
port=8080

start:
	minikube start --cpus=4 --memory=8192

stop:
	minikube stop

dashboard:
	minikube dashboard

apply:
	kubectl apply -f $(service).yaml

apply-rbac:
	kubectl apply -f rock-spawner-rbac.yaml

pods:
	kubectl get pods

services:
	kubectl get services

delete:
	kubectl delete -f $(service).yaml

delete-rbac:
	kubectl delete -f rock-spawner-rbac.yaml

logs:
	kubectl logs -f $(shell kubectl get pods -o name | grep $(service))

port-forward:
	kubectl port-forward service/$(service) $(port):80

service-url:
	minikube service $(service) --url

k3s-perms:
	sudo chmod 755 /etc/rancher/k3s
	sudo chmod 644 /etc/rancher/k3s/k3s.yaml