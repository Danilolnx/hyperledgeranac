FROM hyperledger/fabric-ca:amd64-1.4.0
   
WORKDIR /etc/hyperledger/fabric-ca-server
ENV FABRIC_CA_SERVER_CA_NAME ca.anacaudit.anac.gov.br
ENV ORG_DOMAIN anacaudit.anac.gov.br
ENV FABRIC_CA_HOME /etc/hyperledger/fabric-ca-server
ENV FABRIC_CA_SERVER_TLS_ENABLED TRUE
ENV ORG_FULL_NAME anacaudit.anac.gov.br
ENV ORGANIZATION_DOMAIN anacaudit.anac.gov.br
COPY fabric-ca-server-template.yaml /etc/hyperledger/fabric-ca-server/fabric-ca-server-template.yaml
COPY scripts /etc/hyperledger/fabric-ca-server/scripts
EXPOSE 7054

CMD ["bash","scripts/initca.sh"]

