pipeline {
    agent any

    stages {
        // stage('Checkout') {
        //     steps {
        //         git 'https://github.com/AdrianReyhan/calulator.git'
        //     }
        // }

        stage("Compile") {
            steps {
                sh "./gradlew compileJava"
            }
        }
        stage("Unit test") {
            steps {
                sh "./gradlew test"
            }
          }
    }

    post {
        always {
            echo 'Pipeline selesai.'
        }
    }
}
