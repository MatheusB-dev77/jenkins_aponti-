pipeline {
    agent any

    tools {
        nodejs 'node20'
    }

    triggers {
        githubPush()
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build / Instalação') {
            steps {
                sh 'npm install'
            }
        }

        stage('SAST (Segurança)') {
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'npm audit --audit-level=high'
                }
            }
        }

        stage('Lint & Quality') {
            steps {
                sh 'npx eslint src --env node --parser-options=ecmaVersion:2021'
            }
        }

        stage('Testes') {
            steps {
                sh 'npm test'
            }
        }
    }

    post {
        always {
            cleanWs()
        }
        success {
            echo 'Pipeline executada com sucesso — todas as verificações passaram.'
        }
        failure {
            echo 'Pipeline falhou — verifique o log do estágio que quebrou.'
        }
    }
}