# Create Configmap by CM
> $kubectl create configmap "my-cm-map" --from-literal ip:1.1.1.1 gateway:1.1.1.254
>$kubectl create configmap my-file-map --from-file=mymap.txt