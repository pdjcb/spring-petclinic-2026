FROM maven:3.9-eclipse-temurin-17 AS build
ADD . /app
WORKDIR /app
RUN mvn package


FROM eclipse-temurin:17-jre-alpine
LABEL auther="chandu"
RUN adduser -D -h /usr/share/spc -s /bin/sh spc
USER spc
WORKDIR /usr/share/spc
COPY --from=build /app/target/spring-petclinic-4.0.0-SNAPSHOT.jar /usr/share/spc/spring-petclinic-4.0.0-SNAPSHOT.jar
EXPOSE 8080/tcp
CMD [ "java", "-jar", "/usr/share/spc/spring-petclinic-4.0.0-SNAPSHOT.jar" ]