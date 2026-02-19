####StageBuild##########

FROM maven:3.9.11-amazoncorretto-8 

WORKDIR  /app

COPY . .

RUN mvn clean install package 

#######StageRUN##########
FROM tomcat:9.0.112-jdk17-corretto-al2

COPY --from=0 /app/target/myapp-g20.war   /usr/local/tomcat/webapps/myapp.war
