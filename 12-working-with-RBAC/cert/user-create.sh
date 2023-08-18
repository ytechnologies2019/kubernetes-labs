##Generate key using Openssl
openssl genrsa -out user1.key 2048
##Generate ClientRequest
openssl req -new -key user1.key -out user1.csr -subj "/CN=user1/O=group1"
##Generate the certificate (CRT)
openssl x509 -req -in user1.csr -CA /var/snap/microk8s/current/certs/ca.crt -CAkey /var/snap/microk8s/current/certs/ca.key -CAcreateserial -out user1.crt -days 500
##Set user entry in kubeconfig
kubectl config set-credentials user1 --client-certificate=user1.crt --client-key=user1.key
##Set context Entry in kubeconfig
kubectl config set-context user1-context --cluster=microk8s --user=user1

#####Check
kubectl config view
##Switch to context
kubectl config use-context user1-context
 kubectl config current-context

##Change to admin
kubectl config use-context microk8s
kubectl config current-context

##Test to create deployment
kubectl create deployment nginx
