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
         
         sh 'apt install -y libmysqlclient-dev --force-yes'        
         sh 'pip install -r requirements.txt'
         echo 'ALL modules are installable'
         
             }
         }
        stage('testdb-creation')
        {
            steps
            {
                
         sh 'python manage.py inspectdb > models.py'
         sh 'python manage.py syncdb'
         sh 'python manage.py makemigrations'
         sh 'python manage.py migrate'
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
