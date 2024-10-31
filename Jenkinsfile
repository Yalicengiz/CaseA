pipeline {
    agent {
        kubernetes {
            inheritFrom 'jenkins-agent'
            defaultContainer 'jnlp'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'echo "Building the application..."'
            }
        }
        stage('Deploy') {
            steps {
                sh 'kubectl apply -f k8s-network-policies/rabbitmq-network-policy.yaml'
                sh 'helm install rabbitmq bitnami/rabbitmq --set auth.username=admin --set auth.password=password'
                sh 'kubectl apply -f k8s-network-policies/mongodb-network-policy.yaml'
                sh 'helm install mongodb bitnami/mongodb --set auth.rootPassword=password --set auth.username=admin --set auth.password=password'
                sh 'kubectl apply -f k8s-network-policies/redis-network-policy.yaml'
                sh 'helm install redis bitnami/redis --set auth.enabled=true --set auth.password=password'
            }
        }
    }
}

