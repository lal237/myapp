####### Stage 1: Build #######
# IL MANQUE LE "AS build" ICI :
FROM maven:3.9.11-amazoncorretto-8 AS build  

WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

####### Stage 2: Run #######
FROM tomcat:9.0.112-jdk17-corretto-al2

# On repasse en root pour les manipulations de fichiers
USER root

# On nettoie les applis par défaut
RUN rm -rf /usr/local/tomcat/webapps/*

# On copie le fichier sans le --chown pour l'instant (il appartiendra à root)
COPY --from=build /app/target/myapp-g22.war /usr/local/tomcat/webapps/myapp.war

# On donne les droits de lecture/écriture à tout le monde sur le dossier webapps
# C'est la solution la plus robuste pour les environnements de cours/TP
RUN chmod -R 777 /usr/local/tomcat/webapps /usr/local/tomcat/work /usr/local/tomcat/temp /usr/local/tomcat/logs

# On laisse Tomcat tourner avec son utilisateur par défaut (souvent root sur cette image précise)
# Pas besoin de spécifier USER tomcat si l'utilisateur n'existe pas dans l'OS
EXPOSE 8080

CMD ["catalina.sh", "run"]
