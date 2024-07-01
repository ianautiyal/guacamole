ARG TOMCAT_VERSION=9
ARG TOMCAT_JRE=jdk21

FROM tomcat:${TOMCAT_VERSION}-${TOMCAT_JRE}

ARG GUACAMOLE_VERSION
ARG WEBAPP_CONTEXT

RUN echo ${GUACAMOLE_VERSION}

# Install Guacamole
RUN wget https://downloads.apache.org/guacamole/${GUACAMOLE_VERSION}/binary/guacamole-${GUACAMOLE_VERSION}.war \
    -O /usr/local/tomcat/webapps/${WEBAPP_CONTEXT}.war

COPY guacamole.properties /etc/guacamole/guacamole.properties
COPY user-mapping.xml /etc/guacamole/user-mapping.xml
