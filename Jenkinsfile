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

        stage('Design Quality & Safety Checks') {
            steps {
                echo "================================="
                echo "STAGE 3: DESIGN QUALITY CHECKS"
                echo "================================="

                sh './scripts/design_quality_check.sh'
            }
        }

        stage('Terraform Validate & Plan') {
            steps {
                echo "================================="
                echo "STAGE 4: TERRAFORM VALIDATION"
                echo "================================="

                sh 'terraform -chdir=terraform init -backend=false'
                sh 'terraform -chdir=terraform validate'
                sh 'terraform -chdir=terraform plan'
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
