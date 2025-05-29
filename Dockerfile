FROM quay.io/snowdrop/maven-openjdk11 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package

FROM quay.io/lib/tomcat
COPY --from=builder /app/target/*.war /usr/local/tomcat/webapps/ROOT.war
