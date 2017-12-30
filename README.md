
this is Django example for dockerizations there are other versions but this is complete version 
 is example for dockerizing Djanago git jenkins
added Jenkinsfile

Jenkinsfile structure 
pipeline {
agent <node label>
 stages
 {
 stage('name')
 {
 steps {
 sh(or) echo (or) checkout scm 
 }
 }
 }
 }
