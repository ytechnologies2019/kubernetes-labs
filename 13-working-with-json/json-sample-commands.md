kubectl get pods -o json 
## (Current Object)
kubectl get pods -o=jsonpath='{@}'
## => items[0] , 0=> First Pod , [arrary]
kubectl get pods -o=jsonpath='{.items[0].metadata.name}'
## working with arrary
kubectl get pods -o=jsonpath="{.items[0]['metadata.name', 'metadata.labels']}"
## {'n},{'t'}make json format as beautiful😂
kubectl get pods -o=jsonpath="{.items[0]['metadata.name', 'metadata.labels']}{'\n'}"
kubectl get pods -o=jsonpath="{range .items[*]}{.metadata.name}{'\t'}{'\n'}{end}"

## Check the Multi Arrary
kubectl get deployments -o=jsonpath="{range .items[*]}{.metadata.name}{'\t'}{.spec.replicas}{'\n'}{end}"
