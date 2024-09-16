pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('sairam-dockerhub')
        GOPATH = "${WORKSPACE}"
    }

    stages {
        stage('Checkout') {
            steps {
                echo 'checoutstage'
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
                
                sh 'cd ./go_app && go build main.go'
            }
        }
        
    }
        post {
            always {
                
                echo 'post acction sucessfull'
            }
            success {
                echo 'Build and Test Stages Successful!'
            }
            failure {
                echo 'Build or Test Failed!'
            }
        }
    

}
