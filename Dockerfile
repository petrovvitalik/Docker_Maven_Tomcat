FROM ubuntu:20.04
RUN apt update
RUN apt dist-upgrade -y
RUN apt install default-jdk -y
RUN apt install tomcat9 -y
RUN apt install git -y
RUN apt install maven -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN mvn -f "/boxfuse-sample-java-war-hello/pom.xml" package
RUN cp /boxfuse-sample-java-war-hello/target/*.war /var/lib/tomcat9/webapps/
EXPOSE 8080
CMD ["tomcat9", "-g", "daemon off;"]
