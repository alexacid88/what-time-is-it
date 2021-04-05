FROM openjdk:15-alpine
WORKDIR /work
COPY . /work
RUN ./mvnw package

FROM openjdk:15-alpine
WORKDIR /root/
COPY --from=0 /work/target/what-time-is-it-0.0.1-jar-with-dependencies.jar what-time-is-it.jar
EXPOSE 8080
CMD ["java", "-jar", "what-time-is-it.jar"]