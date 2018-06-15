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
         
         sh 'apt install -y libmysqlclient-dev'        
         sh 'pip install -r requirements.txt'
         echo 'ALL modules are installable'
         
             }
         }
        
        stage('test')
         {
         steps
             {
         
         sh 'python manage.py test'
         
             }
         }
    }
}
