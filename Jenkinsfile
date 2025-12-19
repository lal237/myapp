pipeline {
    agent any

    environment {
        // Nom du serveur SonarQube défini dans "Manage Jenkins > Configure System"
        SONARQUBE_SERVER = 'sonar-server'
        // Nom de l’outil SonarScanner défini dans "Global Tool Configuration"
        SCANNER_HOME     = tool 'SonarQubeScanner'
    }

    stages {

        stage('Clone') {
            steps {
                git credentialsId: 'id_gitlab', url: 'https://repo-dev.efi-academy.com/houcem/myapp-j2e-g20.git'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv("${SONARQUBE_SERVER}") {
                    sh """
                        ${SCANNER_HOME}/bin/sonar-scanner \
                          -Dsonar.projectKey=maven-demo \
                          -Dsonar.projectName=maven-demo \
                          -Dsonar.sources=.
                    """
                }
            }
        }

        stage('Quality Gate') {
            steps {
                timeout(time: 5, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: false
                }
            }
        }

        stage('Build') {
            steps {
                withMaven(jdk: 'java', maven: 'maven', traceability: true) {
                    sh 'mvn clean install package'
                }
            }
        }

        stage('Deploy') {
            steps {
                deploy adapters: [tomcat9(alternativeDeploymentContext: '', credentialsId: 'id_tomcat', path: '', url: 'http://172.16.20.100:8080')],
                       contextPath: null,
                       war: '**/*.war'
            }
        }
    }
}
