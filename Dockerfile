FROM ubuntu
MAINTAINER Pavel Shuvalov
RUN apt-get update && apt-get install -y wget && rm -rf /var/lib/apt/lists/*

ENV ALFRESCO_VERSION 5.0.d
ENV ALFRESCO_BUILD 00002

WORKDIR /install
ADD ./options ./options

ENV ALFRESCO_ADMIN_PASSWORD alfresco

RUN wget http://dl.alfresco.com/release/community/$ALFRESCO_VERSION-build-$ALFRESCO_BUILD/alfresco-community-$ALFRESCO_VERSION-installer-linux-x64.bin && \
	chmod +x alfresco-community-$ALFRESCO_VERSION-installer-linux-x64.bin && \
	./alfresco-community-$ALFRESCO_VERSION-installer-linux-x64.bin --optionfile options \
		--alfresco_admin_password $ALFRESCO_ADMIN_PASSWORD && \
	rm ./alfresco-community-$ALFRESCO_VERSION-installer-linux-x64.bin

EXPOSE 8080

CMD /opt/alfresco/alfresco.sh start && tail -f tail -f /opt/alfresco/tomcat/logs/catalina.out
