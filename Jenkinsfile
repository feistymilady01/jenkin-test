#!/usr/bin/env groovy
pipeline{
    agent any
    environment{
        AWS_ACCESS_KEY_ID=credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY=credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION="eu-west-2a"
        
        CLUSTER_NAME="eks-cluster-micro-app"
    }
    stages{
        stage("Create EKS cluster"){
            steps {
                script{
                    dir('k8-terraform'){
                        sh "terraform init"
                        sh "terraform apply --auto-approve"
                    }
                }
            }
        }
    }
    stage("Deploy to EKS"){
        step {
            script {
                dir('kuber-yaml'){
                    sh "aws eks update-kubeconfig --name eks-cluster-micro-app"
                    sh "kubectl apply -f nginx-deploy.yaml"
                    sh "kubectl apply -f nginx-serv-deploy.yaml"
                    sh "kubectl apply -f promth-deploy.yaml"
                }
            }
        }
    }
}
