pipeline {
    agent any 
     tools { 
        maven 'mavenhome' 
        jdk 'javahome' 
    }
    options {
        disableConcurrentBuilds()
    }
    stages {

       stage ('Compile Stage') {
        steps {
               bat 'mvn clean install'
            }
        }
        stage ('Unit Testing') {
        steps {
               bat 'mvn test'
            }
        }
        stage ('Sonar Scan') {
        steps {
            withSonarQubeEnv('sonarcube scanner') 
            {
              bat 'mvn sonar:sonar'
            }
               
            }
        }

        sonarcube scanner
    }

    
}