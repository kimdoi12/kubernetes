FROM tomcat:9.0

ENV TZ=Asia/Seoul
ENV CATALINA_HOME /usr/local/tomcat
ENV JAVA_HOME /opt/java/openjdk
ENV PATH $PATH:$JAVA_HOME/bin:/usr/share/tomcat/bin

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
  
RUN rm -Rf /usr/local/tomcat/webapps
RUN mkdir -p /usr/local/tomcat/webapps/ROOT
RUN mkdir -p /usr/local/tomcat/webapps/images
COPY ./post/*.* /usr/local/tomcat/webapps/ROOT/.
COPY mysql-connector-j-8.0.33.jar /usr/local/tomcat/lib/.
COPY ./post/*.jpg /usr/local/tomcat/webapps/images/.
COPY BookMarket.war /usr/local/tomcat/webapps/.
COPY server.xml /usr/local/tomcat/conf/.

COPY tomcat /etc/default/.

CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
 