cd /opt/tzlibre
docker-compose -f composes/docker-compose-betanet.yml up -d endorser && docker attach tzlibre_endorser