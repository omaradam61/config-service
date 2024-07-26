# Use an official OpenJDK 17 runtime as a parent image
FROM openjdk:17-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy the project files into the container at /app
COPY . .

# Package the application with Maven Wrapper
RUN chmod +x mvnw
RUN ./mvnw clean package -DskipTests

# Expose the port the app runs on
EXPOSE 6060

# Run the application
CMD ["java", "-jar", "target/config-service-0.0.1-SNAPSHOT.jar"]

