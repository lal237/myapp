pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
               // git credentialsId: 'id_gitlab', url: 'https://repo-dev.efi-academy.com/houcem/myapp-j2e-g17.git'
              checkout scm 

            }
        }

      stage("SonarQube analysis") {
            
            steps {
              withSonarQubeEnv('sonar-server') {
                  withMaven(globalMavenSettingsConfig: '', jdk: 'java', maven: 'maven', mavenSettingsConfig: '', traceability: true) {
                               sh 'mvn clean package sonar:sonar'
                 }
              }
            }
          }
     stage("Quality Gate") {
            steps {
              timeout(time: 1, unit: 'HOURS') {
                waitForQualityGate abortPipeline: true
              }
            }
          }
        
        
       stage('Build'){
           steps{
               script{
                   withMaven(globalMavenSettingsConfig: '', jdk: 'java', maven: 'maven', mavenSettingsConfig: '', traceability: true) {
                      sh ' mvn clean install package'
                          }
                 
               }
           }
       }

 
       
    }
  
  post {
      
      success {
          echo "Pipeline ${env.JOB_NAME} Réussi!"
      }
    
      failure {
          
          echo "Echec du Pipeline ${env.JOB_NAME} !"
      }
      }  
}
