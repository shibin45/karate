pipeline {
    agent any
    tools {
        maven 'Maven3' // This must match the name you created in the Tools menu earlier
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                bat 'mvn clean install'
            }
        }
    }
}