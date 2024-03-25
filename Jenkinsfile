pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the repository
                git branch: 'master', url: 'https://github.com/Fatimahbintiyasin/Comp367_Lab2.git'
            }
        }
        stage('Build') {
            steps {
                // Build the Maven project
                sh 'mvn clean package'
            }
        }
        stage('Docker Build') {
            steps {
                // Build Docker image
                script {
                    docker.build("fatimah5/lab3app")
                }
            }
        }
        stage('Docker Login') {
            steps {
                // Login to Docker Hub
                withCredentials([usernamePassword(usernameVariable: 'fatimah5', passwordVariable: 'pass12345')]) {
                    sh "docker login -u $fatimah5 -p $pass12345"
                }
            }
        }
        stage('Docker Push') {
            steps {
                // Push Docker image to Docker Hub
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub-credentials') {
                        docker.image("fatimah5/lab3app").push('latest')
                    }
                }
            }
        }
    }
}
