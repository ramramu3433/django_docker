pipeline {
    agent any
    
    stages {
         stage('build')
             {
                 steps
                 {
                 checkout scm
                 }
             }
             
         stage('install')
         {
         steps
             {
         
         sh 'apt install libmysqlclient-devtr'        
         sh 'pip install -r requirements.txt'
         
             }
         }
    }
}
