FROM ubuntu:20.04
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update && apt dist-upgrade -y
RUN apt install mlocate
RUN apt install git -y
RUN apt install default-jdk -y
RUN apt install maven -y
RUN apt install tomcat9 -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN cd /boxfuse-sample-java-war-hello && mvn package
RUN rm -rf /var/lib/tomcat/webapps/*
RUN cp /boxfuse-sample-java-war-hello/target/hello-1.0.war /var/lib/tomcat9/webapps/
EXPOSE 8080
CMD service tomcat9 start && tail -f /var/lib/tomcat9/logs/catalina.out

#FROM tomcat:latest
#RUN apt update && apt dist-upgrade -y
#RUN apt install git -y
#RUN apt install maven -y
#RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
#RUN cd boxfuse-sample-java-war-hello && mvn package
#RUN rm -rf /usr/local/tomcat/webapps/*
#RUN cp /usr/local/tomcat/boxfuse-sample-java-war-hello/target/hello-1.0.war /usr/local/tomcat/webapps/

