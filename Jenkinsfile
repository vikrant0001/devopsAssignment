pipeline {
    agent any 
     tools { 
        maven 'mavenhome' 
        jdk 'javahome' 
    }
    stages {

       stage ('Compile Stage') {

            steps {
                withMaven(maven : 'mavenhome') {
                    sh 'mvn clean compile'
                }
            }
        }
    }

    
}