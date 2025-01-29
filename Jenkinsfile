pipeline {
    agent any

    environment {
        TERRAFORM_WORKSPACE = "dev" // Set the Terraform workspace jenkins test
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Terraform Init & Select Workspace') {
            steps {
                script {
                    sh '''
                    terraform init
                    terraform workspace select ${TERRAFORM_WORKSPACE} || terraform workspace new ${TERRAFORM_WORKSPACE}
                    '''
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    sh '''
                    terraform apply -auto-approve
                    '''
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline execution complete.'
        }
        success {
            echo 'Terraform infrastructure deployed successfully in workspace: ' + env.TERRAFORM_WORKSPACE
        }
        failure {
            echo 'Pipeline failed. Check logs for details!!'
        }
    }
}
