pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/AdrianReyhan/calulator.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build('myapp-image')
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    docker.image('myapp-image').inside {
                        // Sesuaikan dengan cara menjalankan test
                        sh './gradlew test'
                    }
                }
            }
        }
    }

    post {
        failure {
            emailext subject: "Build Failed", body: "Build gagal. Cek Jenkins untuk detail.", to: 'dottitoddi@gmail.com'
        }
    }
}
