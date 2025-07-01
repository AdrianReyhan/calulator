pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/AdrianReyhan/calulator.git'
            }
        }

        stage("Compile") {
            steps {
                sh "./gradlew build"  // Disarankan untuk menggunakan 'build' agar mencakup lebih dari sekedar kompilasi
            }
        }

        stage("Unit Test") {
            steps {
                sh "./gradlew test"  // Menjalankan unit test yang ada
            }
        }

        // Optional: Stage untuk quality check menggunakan SonarQube
        stage('Code Quality Check') {
            steps {
                script {
                    sonarQubeScanner(
                        installationName: 'SonarQube', 
                        projectKey: 'calculator-project', 
                        projectName: 'Calculator Project'
                    )
                }
            }
        }

        // Optional: Stage untuk mengupload build artifact
        stage('Publish Artifact') {
            steps {
                archiveArtifacts allowEmptyArchive: true, artifacts: '**/build/libs/*.jar', followSymlinks: false
            }
        }
    }

    post {
        always {
            echo 'Pipeline selesai.'
        }
        success {
            echo 'Build sukses!'
        }
        failure {
            echo 'Build gagal. Harap periksa log untuk detail.'
        }
    }
}
