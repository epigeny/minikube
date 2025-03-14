service=rock
port=7080

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

logs:
	kubectl logs -f $(shell kubectl get pods -o name | grep $(service))

port-forward:
	kubectl port-forward service/$(service)-service $(port):80