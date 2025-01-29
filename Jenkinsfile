pipeline {
    agent any

    parameters {
        choice(name: 'ENVIRONMENT', choices: ['dev', 'qa', 'prod'], description: 'Select the Terraform environment to deploy')
    }

    environment {
        ENV_DIR = "environments/${params.ENVIRONMENT}"  // Set environment folder dynamically
        TFVARS_FILE = "${ENV_DIR}/terraform.tfvars"  // Use environment-specific variables
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
                    terraform init  # Backend is defined in main.tf
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
            when {
                not { environment name: 'ENVIRONMENT', value: 'dev' }  // Prevent auto-apply in dev
            }
            steps {
                dir(ENV_DIR) {
                    sh '''
                    terraform apply -auto-approve -var-file=${TFVARS_FILE}
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
