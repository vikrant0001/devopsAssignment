FROM tomcat:alpine
MAINTAINER VIKRANT 
ADD http://192.168.29.26:8081/artifactory/CI-Automation-JAVA/com/nagarro/devops-tools/devops/demosampleapplication/1.0.0-SNAPSHOT/demosampleapplication-1.0.0-SNAPSHOT.war /usr/local/tomcat/webapps/myapp.war
EXPOSE 9985
CMD ["startup.sh", "run"]


