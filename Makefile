service=rock-spawner
port=7080

start:
	minikube start

stop:
	minikube stop

dashboard:
	minikube dashboard

apply:
	kubectl apply -f $(service).yaml

apply-rbac:
	kubectl apply -f $(service)-rbac.yaml

pods:
	kubectl get pods

services:
	kubectl get services

delete:
	kubectl delete -f $(service).yaml

delete-rbac:
	kubectl delete -f $(service)-rbac.yaml

logs:
	kubectl logs -f $(shell kubectl get pods -o name | grep $(service))

port-forward:
	kubectl port-forward service/$(service)-service $(port):80

service-url:
	minikube service $(service) --url
