pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t myapp-image .'
            }
        }

        stage('Test') {
            steps {
                sh 'docker run --rm myapp-image ./gradlew test'
            }
        }
    }

    post {
        always {
            echo 'Build selesai.'
        }
    }
}
