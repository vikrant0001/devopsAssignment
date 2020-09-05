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
         stage ('Upload to Artifactory') {
        steps {
           rtMavenDeployer(
               id:'deployer',
               serverId:'123456789@artifactory',
               releaseRepo:'CI-Automation-JAVA',
               snapshotRepo:'CI-Automation-JAVA'
            )
            rtMavenRun(
                pom:'pom.xml',
                goals:'clean install',
                deployerId:'deployer'
            )
           rtPublishBuildInfo(
               serverId:'123456789@artifactory'
           )
               
            }
        }
         stage ('Docker image') {
        steps {
            bat 'docker build -t i-vikrant-develop .'
           }
        }
        
       


           stage('Docker container') {
            parallel {
                stage('Pre container check') {
                    steps {
                        script {
                            containerID = powershell(returnStdout: true, script:'docker ps --filter name=i-vikrant-develop --format "{{.ID}}"')
                            if (containerID) {
                                bat "docker stop ${containerID}"
                                bat "docker rm -f ${containerID}"
                            }
                        }
                    }
                }
                 stage ('Image push to dtr') {
                    steps {
                        bat "docker tag i-vikrant-develop dtr.nagarro.com:443/i-vikrant-develop"
                        bat 'docker push  dtr.nagarro.com:443/i-vikrant-develop'
                        }
                    }
                 }
             }
        
        }
}