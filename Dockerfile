FROM tomcat:alpine
MAINTAINER VIKRANT 
ADD http://localhost:8081/artifactory/CI-Automation-JAVA/com.nagarro.devops-tools.devops:demosampleapplication:1.0.0-SNAPSHOT/demosampleapplication-1.0.0-SNAPSHOT.war  /usr/local/tomcat/webapps/myapp.war
EXPOSE 6100
CMD /usr/local/tomcat/bin/catlina.sh.run