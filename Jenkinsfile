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
                // GitHub reposunu çek
                git credentialsId: 'ba8d7be0-9522-446c-b163-618862491df5', url: 'https://github.com/Yalicengiz/CaseA.git'
            }
        }
        stage('Build') {
            steps {
                // Uygulamayı oluştur
                sh 'echo "Building the application..."'
            }
        }
        stage('Deploy') {
            steps {
                // RabbitMQ için network policy uygulama ve Helm ile kurulum
                sh 'kubectl apply -f k8s-network-policies/rabbitmq-network-policy.yaml'
                sh 'helm install rabbitmq bitnami/rabbitmq --set auth.username=admin --set auth.password=password'
                
                // MongoDB için network policy uygulama ve Helm ile kurulum
                sh 'kubectl apply -f k8s-network-policies/mongodb-network-policy.yaml'
                sh 'helm install mongodb bitnami/mongodb --set auth.rootPassword=password --set auth.username=admin --set auth.password=password'
                
                // Redis için network policy uygulama ve Helm ile kurulum
                sh 'kubectl apply -f k8s-network-policies/redis-network-policy.yaml'
                sh 'helm install redis bitnami/redis --set auth.enabled=true --set auth.password=password'
            }
        }
    }
}

