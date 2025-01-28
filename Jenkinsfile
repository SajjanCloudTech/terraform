pipeline {
    agent any

stages{
    stage ('Checkout'){
        steps{
            checkout main
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
}