pipeline {
    agent any

    parameters {
        choice(name: 'ENVIRONMENT', choices: ['dev', 'qa', 'prod'], description: 'Select the Terraform environment to deploy')
    }

    environment {
        ENV_DIR = "environments/${params.ENVIRONMENT}"  // Set environment dynamically
        TFVARS_FILE = "${WORKSPACE}/${ENV_DIR}/terraform.tfvars"  // Full absolute path
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
                    terraform init
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
                not { environment name: 'ENVIRONMENT', value: 'dev' }  // Prevent apply in dev
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
