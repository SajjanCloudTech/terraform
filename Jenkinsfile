pipeline {
    agent any

    parameters {
        choice(name: 'ENVIRONMENT', choices: ['dev', 'qa', 'prod'], description: 'Select the Terraform environment to deploy')
    }

    environment {
        ENV_DIR = "environments/${params.ENVIRONMENT}"  // Dynamically select the environment folder
        TFVARS_FILE = "${ENV_DIR}/terraform.tfvars"  // Variable file for each environment
        BACKEND_FILE = "${ENV_DIR}/backend.tf"  // Backend configuration file
    }

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Verify Backend File') {
            steps {
                script {
                    if (!fileExists("${BACKEND_FILE}")) {
                        error "Error: ${BACKEND_FILE} is missing. Please check your repository."
                    }
                }
            }
        }

        stage('Terraform Init') {
            steps {
                dir(ENV_DIR) {
                    sh '''
                    terraform init -backend-config="backend.tf"
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
                not { environment name: 'ENVIRONMENT', value: 'dev' }  // Prevent automatic apply in dev
            }
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
                environment name: 'ENVIRONMENT', value: 'dev'  // Allow destroy only in development
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
