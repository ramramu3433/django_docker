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
         sh 'ip=`ifconfig eth0 | grep "inet addr:" | cut -d ":" -f2 | awk "{print $1}"`'
         sh 'sed -i "s/<<ip>>/$ip/g" blog/settings.py'
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
       stage('build-docker-image')
        {
            steps
            {
               sh 'docker build -t $JOB_NAME:$BUILD_NUMBER .'
              
            }
        }
    }
}
