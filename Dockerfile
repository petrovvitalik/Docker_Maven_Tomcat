FROM tomcat:latest
RUN apt update && apt dist-upgrade -y
RUN apt install git -y
RUN apt install maven -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN cd boxfuse-sample-java-war-hello && mvn package
RUN rm -rf /usr/local/tomcat/webapps/*
RUN cp /usr/local/boxfuse-sample-java-war-hello/target/hello-1.0.war /usr/local/tomcat/webapps/
RUN ls /usr/local/tomcat/webapps/
EXPOSE 8080