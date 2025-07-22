pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                git credentialsId: 'id_gitlab', url: 'https://repo-dev.efi-academy.com/houcem/myapp-j2e-g17.git'
            }
        }
        
       stage('Build'){
           steps{
               script{
                   withMaven(globalMavenSettingsConfig: '', jdk: 'java', maven: 'maven', mavenSettingsConfig: '', traceability: true) {
                      sh ' clean install package'
                          }
                 
               }
           }
       }
       
       
       stage('deploy'){
           steps{
               deploy adapters: [tomcat9(alternativeDeploymentContext: '', credentialsId: 'id_tomcat', path: '', url: 'http://172.16.17.100:8080')], contextPath: null, war: '**/*.war'
               
           }
           
       }
       
    }
  
  post {
      
      success {
          echo 'Pipeline Réussi!'
      }
    
      failure {
          
          echo 'Echec du Pipeline !'
      }
      }  
}
