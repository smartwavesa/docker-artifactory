# Pull base image
# ---------------
FROM docker.bintray.io/jfrog/artifactory-oss:4.15.0

# Maintainer
# ----------
MAINTAINER Mohamed Bouchenafa <mbouchenafa@smartwavesa.com>

# Install  wget, unzip
# -------------
RUN 	yum install -y wget && \
		yum install -y unzip
		
ENV MYSQL_VERSION 5.1.40
ENV MD5 ed67bcbc617bc949537219d42b8407d5 



# Get MySQL Lib and install it
# -------------------------
WORKDIR /tmp
RUN wget http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-${MYSQL_VERSION}.zip && \
	echo "$MD5  mysql-connector-java-${MYSQL_VERSION}.zip" | md5sum -c - && \
	unzip mysql-connector-java-${MYSQL_VERSION}.zip  && \
	cp mysql-connector-java-5.1.40/mysql-connector-java-5.1.40-bin.jar /opt/jfrog/artifactory/tomcat/lib/mysql-connector-java-5.1.40-bin.jar && \
	rm /tmp/mysql-connector-java-${MYSQL_VERSION}.zip && \
	rm -rf /tmp/mysql-connector-java-${MYSQL_VERSION}

    
ENV ARTIFACTORY_HOME=/var/opt/jfrog/artifactory
	
#CMD ["/bin/sh -c /tmp/run.sh"]
CMD ["/tmp/run.sh"]