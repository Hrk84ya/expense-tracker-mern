pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Docker version'){
            steps{
                sh 'docker --version'
            }
        }
        stage('Backend Image'){
            steps{
                sh 'docker build -t hrk84ya/expense-tracker-backend:latest -f Dockerfile.backend .'
                sh 'docker push hrk84ya/expense-tracker-backend:latest'
            }
        }
        stage('Frontend Image'){
            steps{
                dir('client') {
                    sh 'docker build -t hrk84ya/expense-tracker-frontend:latest .'
                    sh 'docker push hrk84ya/expense-tracker-frontend:latest'
                }
            }
        }
        stage('Minikube Implementation'){
            steps{
                sh 'minikube start'
                sh 'minikube addons enable ingress'
                sh 'minikube addons enable dashboard'
            }
        }
        stage('Deploy'){
            steps{
                sh 'kubectl apply -f k8s/mongodb-deployment.yaml'
                sh 'kubectl apply -f k8s/backend-config.yaml'
                sh 'kubectl apply -f k8s/backend-deployment.yaml'
                sh 'kubectl apply -f k8s/frontend-deployment.yaml'
                sh 'kubectl apply -f k8s/ingress.yaml'
            }
        }
        stage('Minikube Dashboard'){
            steps{
                sh 'minikube dashboard'
            }
        }
        stage('Minikube Service'){
            steps{
                sh 'minikube service frontend --url'
            }
        }
    }
}
