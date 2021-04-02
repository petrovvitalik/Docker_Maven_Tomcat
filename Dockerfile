FROM tomcat:latest
RUN apt update && apt dist-upgrade -y
RUN apt install git -y
RUN apt install maven -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN ls
RUN mvn -f "/boxfuse-sample-java-war-hello/pom.xml" package
RUN cp /boxfuse-sample-java-war-hello/target/*.war /var/lib/tomcat9/webapps/
EXPOSE 8080
#CMD ["tomcat9", "run"]