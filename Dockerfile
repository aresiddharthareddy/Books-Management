# Use official OpenJDK image
FROM openjdk:17-jdk-slim

# Set working directory in container
WORKDIR /app

# Copy the built jar from target folder to the container
COPY target/system-0.0.1-SNAPSHOT.jar app.jar

# Expose the port that Spring Boot uses
EXPOSE 9000

# Run the jar file
ENTRYPOINT ["java", "-jar", "app.jar"]
