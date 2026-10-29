# API Spring Boot compilada a partir do repositório backend, na versão fixada em versoes.env.
# O código chega pelo contexto "source" (o repositório no GitHub), definido no docker-compose.yml.
FROM maven:3.9-eclipse-temurin-21 AS build
WORKDIR /app
COPY --from=source api/pom.xml ./pom.xml
COPY --from=source api/src ./src
RUN mvn -q -B -DskipTests package && cp target/*.jar /app/app.jar

FROM eclipse-temurin:21-jre
WORKDIR /app
COPY --from=build /app/app.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
