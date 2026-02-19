####### Stage 1: Build #######
FROM maven:3.9.11-amazoncorretto-8 AS build

WORKDIR /app

# Copie le code source
COPY . .

# Compile et génère le WAR (on saute les tests pour aller plus vite au début)
RUN mvn clean package -DskipTests

####### Stage 2: Run #######
FROM tomcat:9.0.112-jdk17-corretto-al2

# On utilise le nom défini dans le <finalName> du pom.xml (myapp-g22.war)
# On le renomme en ROOT.war si on veut qu'il soit à la racine (http://ip/) 
# ou myapp.war pour l'avoir sur http://ip/myapp
COPY --from=build /app/target/myapp-g22.war /usr/local/tomcat/webapps/myapp.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
