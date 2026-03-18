FROM eclipse-temurin:17-jre-alpine
LABEL auther="chandu"
WORKDIR /usr/share/spc
ADD target/spring-petclinic-4.0.0-SNAPSHOT.jar /usr/share/spc/spring-petclinic-4.0.0-SNAPSHOT.jar
EXPOSE 8080/tcp
CMD [ "java", "-jar", "/usr/share/spc/spring-petclinic-4.0.0-SNAPSHOT.jar" ]
