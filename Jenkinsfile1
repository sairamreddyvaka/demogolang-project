pipeline {
    agent any
    tools {
        go 'go-1.20'
    }
    environment {
        GO_PROJECT = "https://github.com/sairamreddyvaka/demogolang-project.git" 
        DOCKERHUB_CREDENTIALS = credentials('sairam-dockerhub')
    }
    stages {
        stage('Checkout') {
            steps {
                
                git branch: 'main', url: 'https://github.com/sairamreddyvaka/demogolang-project.git'
            }
        }
        stage('Set up Go Environment') {
            steps {
               
                sh 'go mod tidy'
                
                sh 'go mod download'
            }
        }
        stage('Build') {
            steps {
                
                sh 'go build -o myapp .'
            }
        }
        stage('Test') {
            steps {
                
                echo "Test stage running"
            }
        }
       
        
        stage('Build Docker Image') {
            steps {
                script {
                    
                    def imageName = 'srrvaka/golang_application'
                    def tag = 'BUILD_NUMBER' 
                    
                    
                    sh "docker build -t ${imageName}:${tag} ."
                }
            }
        }
        stage('login to dockerhub') {
            steps{
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('Push Docker Image to Registry') {
            steps {
                script { 
                    def imageName = 'srrvaka/golang_application'
                    def tag = 'BUILD_NUMBER'
                    sh "docker push ${imageName}:${tag}"
                }
            }
        }
    }


    post {
        always {
            sh 'docker logout'
            sh 'go clean'
        }
        success {
            echo 'Build succeeded!'
        }
        failure {
            echo 'Build failed!'
        }
    }
}
