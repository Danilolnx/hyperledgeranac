set -v
export CORE_PEER_MSPCONFIGPATH=/crypto/peerOrganizations/anacaudit.gov.br/users/Admin.anacaudit.gov.br/msp
export CORE_PEER_ADDRESS=peer0.anacaudit.gov.br:7051
export CORE_PEER_LOCALMSPID="anacauditMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=/crypto/peerOrganizations/anacaudit.gov.br/peers/peer0.anacaudit.gov.br/tls/ca.crt

export CHANNEL_NAME=mainchannel
# Create channel
peer channel create -o orderer.anacord.gov.br:7050 -c $CHANNEL_NAME -f /channel-artifacts/channel.tx --tls --cafile /crypto/ordererOrganizations/anacord.anac.gov.br/orderers/orderer.anacord.gov.br/msp/tlscacerts/ca-cert.pem

sleep 10

# Join Peer0 - ANAC Audit
peer channel join -b mainchannel.block

# Join Peer0 - ANAC Pool
CORE_PEER_ADDRESS=peer0.anacpool.gov.br:7051 \
CORE_PEER_LOCALMSPID="anacpoolMSP" \
CORE_PEER_MSPCONFIGPATH=/crypto/peerOrganizations/anacpool.gov.br/users/Admin.anacpool.gov.br/msp \
CORE_PEER_TLS_ROOTCERT_FILE=/crypto/peerOrganizations/anacpool.gov.br/peers/peer0.anacpool.gov.br/tls/ca.crt \
peer channel join -b mainchannel.block


CORE_PEER_ADDRESS=peer0.anacpool.gov.br:7051 \
CORE_PEER_LOCALMSPID="anacpoolMSP" \
CORE_PEER_MSPCONFIGPATH=/crypto/peerOrganizations/anacpool.gov.br/users/Admin.anacpool.gov.br/msp \
CORE_PEER_TLS_ROOTCERT_FILE=/crypto/peerOrganizations/anacpool.gov.br/peers/peer0.anacpool.gov.br/tls/ca.crt \
peer channel update -o orderer.anacord.gov.br:7050 -c $CHANNEL_NAME -f /channel-artifacts/anacpoolMSPanchors.tx --tls --cafile /crypto/ordererOrganizations/anacord.anac.gov.br/orderers/orderer.anacord.gov.br/msp/tlscacerts/ca-cert.pem

sleep infinity
