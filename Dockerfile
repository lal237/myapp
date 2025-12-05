FROM tomcat:9.0.112-jdk17-corretto-al2

COPY target/myapp-g20   /usr/local/tomcat/webapps/