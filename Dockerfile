FROM ubuntu:20.04
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update && apt dist-upgrade -y
RUN apt install git -y
RUN apt install default-jdk -y
RUN apt install maven -y
RUN apt install tomcat9 -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git /home/ubuntu/
RUN cd /home/ubuntu/boxfuse-sample-java-war-hello && mvn package
RUN rm -rf /var/lib/tomcat/webapps/*
RUN cp /home/ubuntu/boxfuse-sample-java-war-hello/target/hello-1.0.war /var/lib/tomcat9/webapps/

#EXPOSE 8080

#FROM tomcat:latest
#RUN apt update && apt dist-upgrade -y
#RUN apt install git -y
#RUN apt install maven -y
#RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
#RUN cd boxfuse-sample-java-war-hello && mvn package
#RUN rm -rf /usr/local/tomcat/webapps/*
#RUN cp /usr/local/tomcat/boxfuse-sample-java-war-hello/target/hello-1.0.war /usr/local/tomcat/webapps/

