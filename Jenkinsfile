pipeline{
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
         sh 'pip install -r requirements.txt'
             }
         }
    }
}
