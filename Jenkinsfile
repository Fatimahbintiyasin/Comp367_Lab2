pipeline{
    agent any
    
    stages{
        stage('Checkout')
        {
            steps{
                git branch: 'main', url: 'https://github.com/Fatimahbintiyasin/Comp367_Lab2.git'
            }
        }
        stage('Maven Build'){
            steps{
                bat "mvn -Dmaven.test.failure.ignore=true clean package"
            }
        }
    }
}
