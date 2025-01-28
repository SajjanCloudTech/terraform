pipeline {
    agent any
    environment {
        TERRAFORM_DIR = 'C:\\Users\\acer\\OneDrive\\Desktop\\sajjan\\CloudTech\\terraform\\terraform-aws'
    }
    stages {
        stage('Terraform Init') {
            steps {
                script {
                    // Navigate to the Terraform directory and initialize
                    bat """
                        cd ${env.TERRAFORM_DIR}
                        terraform init
                    """
                }
            }
        }
        stage('Terraform Plan') {
            steps {
                script {
                    // Navigate to the Terraform directory and execute the plan
                    bat """
                        cd ${env.TERRAFORM_DIR}
                        terraform plan
                    """
                }
            }
        }
    }
}
