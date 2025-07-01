#membuat image Docker dengan dua tahap (multi-stage build)
# Stage 1: Build Stage Menggunakan image Maven untuk membangun aplikasi Java dan menghasilkan file JAR.

FROM maven:3.8.1-jdk-11 as build
WORKDIR /app
COPY . .
RUN mvn clean install   

# Stage 2: Run Stage Menggunakan image yang lebih ringan (JRE) untuk menjalankan aplikasi menggunakan file JAR yang telah dibangun di Stage 1.
FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=build /app/target/myapp.jar .
CMD ["java", "-jar", "myapp.jar"]


#Mengurangi ukuran image akhir

#Memisahkan proses pembangunan aplikasi dan menjalankannya, yang mengarah pada praktik yang lebih efisien dalam pembuatan image Docker.
