pipeline {
    agent any
  
    stages {
        stage('checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'Docker_cred', url: 'https://github.com/Pratik-Argade/test-dockerhub.git']])
            }
        }
        stage('build docker image') {
            steps {
                sh 'docker build -t testimage .'
            }
        }
        stage('Docker Login') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'Docker_cred', passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')])
                    {
                        sh "echo $PASSWORD | docker login -u $USERNAME --password-stdin"
                    }
                }
            }
        }
        stage('push image on a dockerhub') {
            steps  {
                sh 'docker tag testimage pratikargade350/testimage:latest'
                sh 'docker push pratikargade350/testimage:latest' 
            }
        }
    }
}
