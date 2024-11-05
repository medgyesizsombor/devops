pipeline {
    agent any

    tools {
        nodejs 'NodeJS 20'
    }

    environment {
        GITHUB_REPO = 'https://github.com/medgyesizsombor/nodejs-for-devops.git'
        BRANCH = 'main'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: env.BRANCH, url: env.GITHUB_REPO
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm ci'
            }
        }

        stage('Lint') {
            steps {
                sh 'npm run lint'
            }
        }

        stage('Test Source') {
            steps {
                sh 'npm run test:src'
            }
        }

        stage('Archive Artifacts') {
            steps {
                archiveArtifacts artifacts: 'dist/**/*', fingerprint: true
            }
        }

        stage('Deploy') {
            when {
                anyOf {
                    branch 'main'
                }
            }
            steps {
                echo 'Deploying the application...'

            }
        }

        stage('Cleanup') {
            steps {
                deleteDir()
            }
        }
    }

    post {
        success {
            echo 'Pipeline sikeresen lefutott!'
        }
        failure {
            echo 'A pipeline végrehajtása sikertelen'
        }
    }
}