FROM openjdk:10-jre-slim
RUN mkdir -p /app/zuul-service/
COPY build/libs/zuul.jar /app/zuul-service/zuul.jar
RUN apt-get update -y
RUN apt-get install -y vim
RUN apt-get install curl -y
RUN apt-get install -y procps
RUN apt-get install htop -y
RUN apt-get update -y
RUN java -version
VOLUME /tmp
RUN bash -c 'touch /app/zuul-service/zuul.jar'
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app/zuul-service/zuul.jar"]
EXPOSE 8005
