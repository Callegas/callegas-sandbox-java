FROM frolvlad/alpine-oraclejdk8:slim
VOLUME /tmp
ADD build/libs/ms-tweet-counter-github-repos-1.0.jar app.jar
RUN sh -c 'touch /app.jar'
EXPOSE 8080
ENV JAVA_OPTS=""
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-Dapp.port=${app.port}", "-jar","/app.jar"]