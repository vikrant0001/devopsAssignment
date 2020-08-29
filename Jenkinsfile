pipeline {
    agent any 
     tools { 
        maven 'mavenhome' 
        jdk 'javahome' 
    }
    stages {

       stage ('Compile Stage') {

            steps {
               bat 'mvn clean install'
            }
        }
    }

    
}