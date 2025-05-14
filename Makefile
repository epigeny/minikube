service=rock-spawner
port=8080

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
	kubectl port-forward service/$(service) $(port):80

service-url:
	minikube service $(service) --url

opal-apps-config:
	echo '{"token": "","rockConfigs": [{"host": "http://rock:8085"}],"rockSpawnerConfigs": [{"host": "http://rock-spawner:8000"}]}' | opal rest -o http://localhost:8080 -u administrator -p password -ct "application/json" -m PUT /apps/config

k3s-perms:
	sudo chmod 755 /etc/rancher/k3s
	sudo chmod 644 /etc/rancher/k3s/k3s.yaml