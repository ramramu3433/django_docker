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
                
         sh 'sudo python manage.py inspectdb > models.py'
         sh 'sudo python manage.py syncdb --noinput'
         sh 'sudo python manage.py makemigrations'
         sh 'sudo python manage.py migrate'
         sh 'echo "from django.contrib.auth.models import User; User.objects.create_superuser("myadmin", "myemail@example.com", "hunter2")" | python manage.py shell'       
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
