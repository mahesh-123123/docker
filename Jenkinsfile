pipeline {
    agent any

    stages {
        stage('SCM') {
            steps {
                git branch: 'master', url: 'https://github.com/mahesh-123123/docker.git'
            }
        }
        stage('Maven Build') {
            steps {
                bat 'mvn clean'
                bat 'mvn install'
                bat 'mvn package'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                  bat 'docker build -t maheshreddy123/javaapp:v4 .'
                 
                }
            }
        }
        
          stage('Deploy Docker Image') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'dockerhub',  url: '') {
                bat 'docker push maheshreddy123/javaapp:v4'
               
                }
              }
            }
          }
        
        stage('Deploy in Tomcat') {
            steps {
                deploy adapters: [tomcat9(credentialsId: 'webserver', path: '', url: 'http://localhost:8080/')], contextPath: 'docker3', war: '**/*.war'
            }
        }
        stage('Email') {
            steps {
                mail bcc: '', body: '''Dear Sir,

                        i am Mahesh Reddy from testing department. web application was successfully git clone, 
                        maven build, docker build, push docker hub, 
                        deploy in tomcat sending to mail..''', cc: '', from: '', replyTo: '', subject: 'jenkins to docker hub', to: 'mmssrraju123@gmail.com'
                
            }
        }
    }
}


