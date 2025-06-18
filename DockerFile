# Stage 1: Build Stage
FROM maven:3.8.1-jdk-11 as build
WORKDIR /app
COPY . .
RUN mvn clean install   


# Stage 2: Run Stage
FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=build /app/target/myapp.jar .
CMD ["java", "-jar", "myapp.jar"]



