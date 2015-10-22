# Base Image
FROM koyadume/java:8.x

# Maintainer
MAINTAINER Shailendra Singh <shailendra_01@outlook.com>

ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
RUN mkdir -p "$CATALINA_HOME"
WORKDIR $CATALINA_HOME

ENV TOMCAT_DOWNLOAD_URL http://www.us.apache.org/dist/tomcat/tomcat-8/v8.0.26/bin/apache-tomcat-8.0.26.tar.gz
ENV LOCAL_FILE tomcat.tar.gz

RUN wget "$TOMCAT_DOWNLOAD_URL" -O $LOCAL_FILE  \
    && tar -xf $LOCAL_FILE --strip-components=1 \
    && rm $LOCAL_FILE \
    && rm bin/*.bat

COPY setenv.sh bin/

EXPOSE 8080

CMD ["catalina.sh", "run"]

