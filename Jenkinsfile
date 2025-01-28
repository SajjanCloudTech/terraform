pipeline {
    agent any

stages{
    stage ('Checkout'){
        steps{
            checkout scm
        }
    }

    stage('Terraform init') {
        steps {
            script{
                sh 'terraform init'
            }
         
        }
    }
    // stage('Terraform Plan') {
    //      steps {
    //         script {
    //             sh 'terraform plan'
    //         }
            
    //      }
    // }
        stage('Terraform Apply') {
         steps {
            script{
                sh 'terraform apply -auto-approve'
            }
            
         }
    }
    }
     post {
        always {
            echo 'Pipeline execution complete.'
        }
        success {
            echo 'Terraform infrastructure deployed successfully.'
        }
        failure {
            echo 'Pipeline failed. Check logs for details!'
        }
     }
}