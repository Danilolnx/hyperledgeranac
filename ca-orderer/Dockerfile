FROM hyperledger/fabric-ca:amd64-1.4.0
   
WORKDIR /etc/hyperledger/fabric-ca-server
ENV FABRIC_CA_SERVER_CA_NAME ca.anacord.anac.gov.br
ENV ORG_DOMAIN anacord.anac.gov.br
ENV ORGANIZATION_DOMAIN anacord.anac.gov.br
ENV FABRIC_CA_HOME /etc/hyperledger/fabric-ca-server
ENV FABRIC_CA_SERVER_TLS_ENABLED TRUE

COPY fabric-ca-server-template.yaml /etc/hyperledger/fabric-ca-server/fabric-ca-server-template.yaml
COPY scripts /etc/hyperledger/fabric-ca-server/scripts
EXPOSE 7054

CMD ["bash","scripts/initca.sh"]


