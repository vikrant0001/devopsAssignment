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
        
}

    
}