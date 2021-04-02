FROM ubuntu:20.04
RUN apt update
RUN apt dist-upgrade -y
RUN apt install default-jdk -y
RUN apt install tomcat9 -y
RUN apt install git -y
RUN apt install maven -y
RUN git clone https://github.com/McMagic/Crapout.git
RUN cd Crapout
RUN mvn package
RUN cd target
RUN cp *.war /var/lib/tomcat9/webapps/
EXPOSE 8080
