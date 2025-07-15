# Deploying Expense Tracker on Minikube

This guide will help you deploy the Expense Tracker application on Minikube.

## Prerequisites

1. Install [Docker](https://docs.docker.com/get-docker/)
2. Install [Minikube](https://minikube.sigs.k8s.io/docs/start/)
3. Install [kubectl](https://kubernetes.io/docs/tasks/tools/)
4. Have a [Docker Hub](https://hub.docker.com/) account (or another container registry)

## Setup Instructions

1. **Start Minikube**
   ```bash
   minikube start --cpus=4 --memory=8192 --disk-size=20g
   ```

2. **Set Docker environment to use Minikube's Docker daemon**
   ```bash
   eval $(minikube docker-env)
   ```

3. **Update the deploy.sh script**
   - Open `deploy.sh`
   - Replace `your-docker-username` with your actual Docker Hub username

4. **Make the deploy script executable**
   ```bash
   chmod +x deploy.sh
   ```

5. **Run the deployment script**
   ```bash
   ./deploy.sh
   ```

6. **Access the application**
   - The script will add an entry to your /etc/hosts file
   - Access the application at: http://expense-tracker.local
   - Or get the URL by running:
     ```bash
     minikube service frontend --url
     ```

## Verifying the Deployment

1. Check all pods are running:
   ```bash
   kubectl get pods
   ```

2. Check services:
   ```bash
   kubectl get svc
   ```

3. Check ingress:
   ```bash
   kubectl get ingress
   ```

## Troubleshooting

1. If you get a permission denied error when running the deploy script, run:
   ```bash
   chmod +x deploy.sh
   ```

2. If the application is not accessible, check the logs:
   ```bash
   kubectl logs -l app=expense-tracker,component=frontend
   kubectl logs -l app=expense-tracker,component=backend
   kubectl logs -l app=expense-tracker,component=mongodb
   ```

3. To delete the deployment:
   ```bash
   kubectl delete -f k8s/
   ```

## Production Considerations

1. Use a managed database service instead of running MongoDB in the cluster
2. Configure proper secrets management (e.g., HashiCorp Vault)
3. Set up proper monitoring and logging
4. Configure HTTPS with a valid certificate
5. Set up proper resource requests and limits
6. Consider using a managed Kubernetes service for production workloads
