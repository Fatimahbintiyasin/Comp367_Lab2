pipeline{
    agent any
    
    stages{
        stage('Checkout')
        {
            steps{
                git branch: 'main', url: 'https://github.com/Fatimahbintiyasin/Comp367_Lab2.git'
            }
        }
        stage('Build'){
            steps{
                sh 'mvn clean install'
            }
        }
    }
}
