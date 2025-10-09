###Stage Build

FROM maven:3.9.11 as builder

WORKDIR /app

COPY . . 

RUN mvn clean install package -Dskiptest

###Stage RUN

FROM tomcat:9.0.110-jre17

COPY --from=builder /app/target/*.war /usr/local/tomcat/webapps