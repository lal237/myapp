####### Stage 2: Run #######
FROM tomcat:9.0.112-jdk17-corretto-al2

# On définit explicitement l'utilisateur pour être sûr
USER root

# On supprime les exemples par défaut de Tomcat pour éviter les conflits
RUN rm -rf /usr/local/tomcat/webapps/*

# On copie le fichier ET on change le propriétaire (chown) en une seule étape
COPY --from=build --chown=tomcat:tomcat /app/target/myapp-g22.war /usr/local/tomcat/webapps/myapp.war

# On s'assure que le dossier webapps appartient bien à tomcat
RUN chown -R tomcat:tomcat /usr/local/tomcat/webapps /usr/local/tomcat/work /usr/local/tomcat/temp /usr/local/tomcat/logs

# On repasse sur l'utilisateur tomcat pour la sécurité
USER tomcat

EXPOSE 8080
CMD ["catalina.sh", "run"]
