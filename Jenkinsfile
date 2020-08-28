pipeline {
    agent any 
     tools { 
        maven 'mavenhome' 
        jdk 'javahome' 
    }
    stages {
        stage('Build') {
            steps {
               sh "mvn -version"
            }
        }
    }
}