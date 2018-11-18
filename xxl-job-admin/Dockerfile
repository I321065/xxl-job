FROM openjdk:7-jre-slim
MAINTAINER yinzheng

ENV PARAMS=""

ENV TZ="Asia/Shanghai"
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ADD target/xxl-job-admin-*.jar /app.jar

ENTRYPOINT ["sh","-c","java -jar /app.jar $PARAMS"]