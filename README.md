# DOCKER
```
# List running docker containers
docker ps
docker-compose ps

# Run a command on a running docker container
docker exec -it <DOCKER_ID> <CMD>

# Start a docker container and run a command right away (in this case a shell)
docker run -it <DOCKER_ID> sh

# Build and tag container, latest version
docker build -t jamespsteinberg/EXAMPLENAME:latest .

# Rebuild only steps that changed
docker-compose up

# Rebuild all steps
docker-compose up --build
```

# INSTALL AND RUN KUBERNETES
```
brew install kubectl
brew cask install minikube

# Start up kubernetes
minikube start

# Uses minikube
eval $(minikube docker-env)
```

# KUBERNETES INFO
```
# Local ip to run on
minikube ip

kubectl cluster-info
kubectl apply -f <FOLDER_OR_FILE>

# List different service types running
kubectl get pods
kubectl get services
kubectl get deployments
kubectl get storageclass
kubectl get pv
kubectl get pvc
kubectl get secrets

# GUI
minikube dashboard

# More info (See if configuration took effect)
kubectl describe <SERVICE>
kubectl describe pod
```

#KUBERNETES DECLARITIVE COMMANDS
```
# Remove service yaml file from cluster
kubectl delete -f <YAML_FILE>

# Delete service (temporarily if yaml file still exists)
kubectl delete <SERVICE> <SERVICE_NAME>
kubectl delete deployment client-deployment
kubectl delete services client-node-port

# List logs
kubectl logs <SERVICE_ID>
kubectl logs server-deployment-54ddc78bf8-5rrsl

# Update image
kubectl set image deployment/client-deployment client=jamespsteinberg/multiclient:v5

# Create ENV variables
kubectl create secret generic pgpassword --from-literal <PASSWORD_KEY>=<PASSWORD_VALUE_HERE>
```

# Run with Ingress Nginx
```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/mandatory.yaml
minikube addons enable ingress
kubectl apply -f k8s
```

# WORKING WITH DOCKERHUB
```
# Push to docker hub
docker build -t jamespsteinberg/multiclient .
docker push jamespsteinberg/multiclient
```

# CONNECT WITH TRAVIS CI
```
# Copy repo into new ruby container in folder app
docker run -it -v $(pwd):/app ruby:2.3 sh

cd app
gem install travis
travis login
# encrypt google cloud password file
travis encrypt-file service-account.json -r jamespsteinberg/multi-k8s
# Follow instructions to add command to .yaml file under BEFORE_INSTALL, delete service-account.json file (and definitely don't put it in git repo) and add encrypted file to repo
```
