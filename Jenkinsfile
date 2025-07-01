pipeline {
    agent any


    stages {
        //Mengambil kode terbaru dari repository.
        // stage('Checkout') {
        //     steps {
        //         git 'https://github.com/AdrianReyhan/calulator.git'
        //     }
        // }

        //Melakukan kompilasi kode menggunakan Gradle...
        stage("Compile") {
            steps {
                sh "./gradlew compileJava"
            }
        }
        //Menjalankan unit test untuk memastikan tidak ada kesalahan dalam kode.
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
