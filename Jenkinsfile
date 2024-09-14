pipeline {
    agent {
        docker {
            
            image 'golang:1.20'  
        }
    }
    environment {
        GO_PROJECT = "https://github.com/sairamreddyvaka/demogolang-project.git" 
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
        
        
    }
    post {
        always {
            
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
