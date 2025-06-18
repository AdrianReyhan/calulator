pipeline {
    agent any

    stages {
       /*  stage('Checkout') {
            steps {
                git 'https://github.com/AdrianReyhan/calulator.git'
            }
        } */

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
    success {
        mail to: 'dottitoddi@gmail.com',
             subject: 'Build Sukses',
             body: 'Pipeline berhasil.'
    }
    failure {
        mail to: 'dottitoddi@gmail.com',
             subject: 'Build Gagal',
             body: 'Pipeline gagal. Cek Jenkins.'
    }
}

}
