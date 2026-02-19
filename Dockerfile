####### Stage 1: Build #######
# IL MANQUE LE "AS build" ICI :
FROM maven:3.9.11-amazoncorretto-8 AS build  

WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

####### Stage 2: Run #######
FROM tomcat:9.0.112-jdk17-corretto-al2

USER root
RUN rm -rf /usr/local/tomcat/webapps/*

# Ici, "--from=build" cherchera maintenant l'étape nommée plus haut
COPY --from=build --chown=tomcat:tomcat /app/target/myapp-g22.war /usr/local/tomcat/webapps/myapp.war

RUN chown -R tomcat:tomcat /usr/local/tomcat/webapps
USER tomcat

EXPOSE 8080
CMD ["catalina.sh", "run"]
