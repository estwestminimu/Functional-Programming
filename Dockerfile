FROM sbtscala/scala-sbt:eclipse-temurin-alpine-24.0.1_9_1.11.7_3.7.3

EXPOSE 8080

WORKDIR /app

COPY . .

#RUN sbt update

CMD ["sbt", "example/run"]