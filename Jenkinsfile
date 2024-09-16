pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('sairam-dockerhub')
        GOPATH = "${WORKSPACE}"
    }

    stages {
        stage('Checkout') {
            steps {
                
                git branch: 'main', url: 'https://github.com/sairamreddyvaka/demogolang-project.git'
            }
        }
        
        stage('Test') {
            steps {
                 echo 'Run your test scripts'
                
            }
        }
        stage('Build') {
            steps {
                
                sh 'cd ./go_app && go build -o myapp'
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

        post {
            always {
                
                cleanWs()
            }
            success {
                echo 'Build and Test Stages Successful!'
            }
            failure {
                echo 'Build or Test Failed!'
            }
        }
    }

}