pipeline {
    agent any
    environment {
        AWS_REGION = 'us-east-2' 
    }
    stages {
        stage('Set AWS Credentials') {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'manning_AWS' 
                ]]) {
                    sh '''
                    echo "AWS Credentials Set"
                    aws sts get-caller-identity
                    '''
                }
            }
        }
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/ChaManRoRo/manning-aws-jenkins-pipeline.git' 
            }
        }
        stage('Initialize Terraform') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Plan Terraform') {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'manning_AWS'
                ]]) {
                    sh 'terraform plan -out=tfplan'
                }
            }
        }
        stage('Apply Terraform') {
            steps {
                input message: "Approve Terraform Apply?", ok: "Deploy"
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'manning_AWS'
                ]]) {
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }
        stage('Destroy Terraform') {
            steps {
                input message: "Approve Terraform Destroy?", ok: "Destroy"
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'manning_AWS'
                ]]) {
                    sh 'terraform destroy -auto-approve'
                }
            }
        }
    }
    post {
        success {
            echo 'Terraform operation completed successfully!'
        }
        failure {
            echo 'Terraform operation failed!'
        }
    }
}

