pipeline {
    agent any

    parameters {
        choice(name: 'ENVIRONMENT', choices: ['dev', 'qa', 'prod'], description: 'Select the Terraform environment to deploy')
    }

    environment {
        ENV_DIR = "environments/${params.ENVIRONMENT}"  // Dynamically set the environment folder
        TFVARS_FILE = "${ENV_DIR}/terraform.tfvars"
    }

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                dir(ENV_DIR) {
                    sh '''
                    terraform init -backend-config="${ENV_DIR}/backend.tf"
                    '''
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir(ENV_DIR) {
                    sh '''
                    terraform plan -var-file=${TFVARS_FILE}
                    '''
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir(ENV_DIR) {
                    sh '''
                    terraform apply -auto-approve -var-file=${TFVARS_FILE}
                    '''
                }
            }
        }

        stage('Terraform Destroy') {
            when {
                environment name: 'ENVIRONMENT', value: 'dev'  // Only allow destroy in development
            }
            steps {
                dir(ENV_DIR) {
                    sh '''
                    terraform destroy -auto-approve -var-file=${TFVARS_FILE}
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
            echo 'Terraform applied successfully in environment: ' + params.ENVIRONMENT
        }
        failure {
            echo 'Pipeline failed. Check logs for details!'
        }
    }
}
