pipeline {
    agent {
        kubernetes {
            label 'jenkins-agent'
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
                sh 'kubectl apply -f rabbitmq-network-policy.yaml'
                sh 'helm install rabbitmq bitnami/rabbitmq --set auth.username=admin --set auth.password=password'
            }
        }
    }
}

