#!/bin/bash

DOCKER_USERNAME="YOUR-DOCKER-USERNAME"

docker build -t $DOCKER_USERNAME/expense-tracker-backend:latest -f Dockerfile.backend .
docker push $DOCKER_USERNAME/expense-tracker-backend:latest

cd client
docker build -t $DOCKER_USERNAME/expense-tracker-frontend:latest .
docker push $DOCKER_USERNAME/expense-tracker-frontend:latest
cd ..

kubectl apply -f k8s/mongodb-deployment.yaml
kubectl apply -f k8s/backend-config.yaml
kubectl apply -f k8s/backend-deployment.yaml
kubectl apply -f k8s/frontend-deployment.yaml
kubectl apply -f k8s/ingress.yaml

minikube addons enable ingress

echo "Deployment complete!"
echo "To access the application, run: minikube service frontend --url"
