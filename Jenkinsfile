pipeline {
    agent any

    stages {
        stage('war') {
            steps {
                git branch: 'master', url: 'https://github.com/mahesh-123123/docker.git'
            }
        }
        stage('build') {
            steps {
                bat 'mvn clean'
                bat 'mvn install'
                bat 'mvn package'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                  bat 'docker build -t javaapp:v1 .'
                }
            }
        }
        stage('deploy') {
            steps {
                deploy adapters: [tomcat9(credentialsId: 'webserver', path: '', url: 'http://localhost:8080/')], contextPath: 'docker1', war: '**/*.war'
            }
        }
    }
}
