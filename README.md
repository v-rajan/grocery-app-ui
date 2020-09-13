Voting app build with Angluar and PrimeNG to be deployed on Kubernetes.

[Angluar](https://angular.io/)

[PrimeNG](https://www.primefaces.org/primeng/)

# Prerequites
* Node.js
* Docker
* kubectl for Kubernetes deployment

# Tools
* [LENS : Kubernetes IDE](https://k8slens.dev/)

# Setup
### Build
```console
npm install
```
### Start Server

```console
ng serve --watch
```

# Docker
[grocery-app-ui](https://hub.docker.com/repository/docker/vrajan/grocery-app-ui)
## Start Server
```console
docker run  -t \
    --name grocery-app-ui \
    -p 80:8080 \
    vrajan/grocery-app-ui:latest
````
# kubernetes
 
## Install
```console
kubectl create  -f k8s/kubernetes.yml
serviceaccount/grocery-app-ui created
service/grocery-app-ui created
deployment.apps/grocery-app-ui created

NAME                              READY   STATUS    RESTARTS   AGE
grocery-app-ui-7fc8b6f44c-pzfvn   1/1     Running   0          18s

kubectl get svc
NAME             TYPE           CLUSTER-IP      EXTERNAL-IP      PORT(S)                         AGE
grocery-app-ui   LoadBalancer   10.158.13.239   34.227.94.113    80:30788/TCP                    89s

kubectl get deployment
NAME             READY   UP-TO-DATE   AVAILABLE   AGE
grocery-app-ui   1/1     1            1           65s
````

# Testing

### Web test
```console
http://34.227.94.113
```   
