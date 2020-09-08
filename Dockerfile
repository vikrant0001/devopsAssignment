FROM tomcat:alpine
MAINTAINER VIKRANT 
COPY target/devopssampleapplication.war /usr/local/tomcat/webapps/vikrant01.war
EXPOSE 8080
CMD ["catalina.sh", "run"]


