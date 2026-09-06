pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                echo "================================="
                echo "STAGE 1: CHECKING SOURCE VERSION"
                echo "================================="

                sh 'git log -1 --format="Building Commit: %H"'
            }
        }

        stage('RTL Simulation') {
            steps {
                echo "================================="
                echo "STAGE 2: RUNNING RTL SIMULATION"
                echo "================================="

                sh './scripts/simulate.sh'
            }
        }

    }

    post {

        success {
            echo "================================="
            echo "CI PIPELINE PASSED"
            echo "================================="
        }

        failure {
            echo "================================="
            echo "CI PIPELINE FAILED"
            echo "================================="
        }

    }
}
