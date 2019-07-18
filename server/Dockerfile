FROM maven:latest AS maven

COPY . .

RUN ["mvn", "package"]

FROM java:8

COPY --from=maven target/Spring_Day_Two-0.0.1-SNAPSHOT.jar /opt/Spring_Day_Two-0.0.1-SNAPSHOT.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/opt/Spring_Day_Two-0.0.1-SNAPSHOT.jar"]
