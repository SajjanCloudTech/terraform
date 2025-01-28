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
            sh 'C:\Users\acer\OneDrive\Desktop\sajjan\CloudTech\terraform\terraform-aws && terraform init'
        }
    }
    stage('Terraform Plan') {
         steps {
            sh 'C:\Users\acer\OneDrive\Desktop\sajjan\CloudTech\terraform\terraform-aws && terraform plan'
         }
    }
        stage('Terraform Apply') {
         steps {
            sh 'C:\Users\acer\OneDrive\Desktop\sajjan\CloudTech\terraform\terraform-aws && terraform apply'
         }
    }
    }
}