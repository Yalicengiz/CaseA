FROM jenkins/jenkins:lts

# Jenkins yönetici kullanıcı erişimlerini otomatikleştir
USER root

# Kubectl, Helm ve Minikube yükle
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \\
    chmod +x kubectl && \\
    mv kubectl /usr/local/bin/

RUN curl -LO https://get.helm.sh/helm-v3.10.2-linux-amd64.tar.gz && \\
    tar -zxvf helm-v3.10.2-linux-amd64.tar.gz && \\
    mv linux-amd64/helm /usr/local/bin/helm && \\
    rm -rf helm-v3.10.2-linux-amd64.tar.gz linux-amd64

RUN curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && \\
    chmod +x minikube && \\
    mv minikube /usr/local/bin/

# Docker CLI yükle
RUN apt-get update && apt-get install -y docker.io

# Jenkins kullanıcı erişimlerini tekrar aktif edin
USER jenkins
