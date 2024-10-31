pipeline {
    agent {
        kubernetes {
            inheritFrom 'jenkins-agent'
            defaultContainer 'jnlp'
        }
    }
    stages {
        stage('Clone Repository') {
            steps {
                git credentialsId: 'ba8d7be0-9522-446c-b163-618862491df5', url: 'https://github.com/Yalicengiz/CaseA.git'
            }
        }
        stage('Build') {
            steps {
                sh 'echo "Building the application..."'
            }
        }
        stage('Deploy') {
            steps {
                sh 'echo "Applying RabbitMQ Network Policy..."'
                sh 'kubectl apply -f k8s-network-policies/rabbitmq-network-policy.yaml'
                sh 'echo "Installing RabbitMQ..."'
                sh 'helm install rabbitmq bitnami/rabbitmq --set auth.username=admin --set auth.password=password'
                
                sh 'echo "Applying MongoDB Network Policy..."'
                sh 'kubectl apply -f k8s-network-policies/mongodb-network-policy.yaml'
                sh 'echo "Installing MongoDB..."'
                sh 'helm install mongodb bitnami/mongodb --set auth.rootPassword=password --set auth.username=admin --set auth.password=password'
                
                sh 'echo "Applying Redis Network Policy..."'
                sh 'kubectl apply -f k8s-network-policies/redis-network-policy.yaml'
                sh 'echo "Installing Redis..."'
                sh 'helm install redis bitnami/redis --set auth.enabled=true --set auth.password=password'
            }
        }
    }
}

