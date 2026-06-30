FROM eclipse-temurin:17-jre
WORKDIR /app

# Mise à jour des paquets de l'OS pour corriger les failles détectées par Trivy
USER root
RUN apt-get update && apt-get upgrade -y && rm -rf /var/lib/apt/lists/*

COPY target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","app.jar"]