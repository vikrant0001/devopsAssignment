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

       stage ('Build') {
        steps {
               bat 'mvn clean install'
            }
        }
        stage ('Unit Testing') {
        steps {
               bat 'mvn test'
            }
        }
        stage ('Sonar Analysis') {
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
        stage('Containers') {
            parallel {
                stage('Precontainer Check') {
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
                 stage ('PushtoDTR') {
                    steps {
                        bat "docker tag i-vikrant-develop dtr.nagarro.com:443/i-vikrant-develop"
                      //  bat 'docker push  dtr.nagarro.com:443/i-vikrant-develop'
                        }
                    }
                 }
             }
             stage ('Docker Deployment') {
                    steps {
                     
                bat "docker run -p 6000:8080 i-vikrant-develop"
                         }
            } 
            // stage ('Helm chart Deployment') {
            //         steps {
                     
            //     bat " helm install fourthhelm ./nagp-assignment-chart"
            //              }
            // } 
        
        }
}