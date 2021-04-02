FROM ubuntu:20.04
RUN sudo apt update
RUN sudo apt dist-upgrade -y
RUN sudo apt install default-jdk -y
RUN sudo apt install tomcat9 -y
RUN sudo apt install git -y
RUN sudo apt install maven -y
RUN git clone https://github.com/McMagic/Crapout.git
RUN cd Crapout
RUN mvn package
RUN cd target
RUN cp *.war /var/lib/tomcat9/webapps/
EXPOSE 8080
