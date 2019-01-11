docker build -t jamespsteinberg/multiclient:lastest -t jamespsteinberg/multiclient:$SHA -f ./client/Dockerfile ./client
docker build -t jamespsteinberg/multiserver:lastest -t jamespsteinberg/multiserver:$SHA -f ./server/Dockerfile ./server
docker build -t jamespsteinberg/multiworker:lastest -t jamespsteinberg/multiworker:$SHA -f ./worker/Dockerfile ./worker

docker push jamespsteinberg/multiclient:latest
docker push jamespsteinberg/multiserver:latest
docker push jamespsteinberg/multiworker:latest

docker push jamespsteinberg/multiclient:$SHA
docker push jamespsteinberg/multiserver:$SHA
docker push jamespsteinberg/multiworker:$SHA

kubectl apply -f k8s

kubectl set image deployments/server-deployment server=jamespsteinberg/multiserver:$SHA
kubectl set image deployments/client-deployment client=jamespsteinberg/multiclient:$SHA
kubectl set image deployments/worker-deployment worker=jamespsteinberg/multiworker:$SHA
