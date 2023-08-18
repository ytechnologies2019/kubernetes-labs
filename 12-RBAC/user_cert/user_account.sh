##Generate SSL
openssl genrsa -out user1.key 2048
##Generate a Client Sign Request (CSR)
openssl req -new -key user1.key -out user1.csr -config openssl.conf
##Generate the Certificate (CRT)
 openssl x509 -req -in user1.csr -CA ~/.minikube/ca.crt -CAkey ~/.minikube/ca.key -CAcreateserial -out user1.crt -days 500
##Start user entry in kubeconfig
kubectl config set-credentials user1 --client-certificate=user1.crt --client-key=user1.key
##Set context entry in kubeconfig
kubectl config set-context user1-context --cluster=minikube --user=user1

##Switch User
kubectl config use-context user1-context
kubectl config current-context

##Switch Minikube User
kubectl config use-context minikube
kubectl config current-context