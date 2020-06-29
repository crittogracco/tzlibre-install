cd /opt/tzlibre
docker-compose -f composes/docker-compose-betanet.yml up -d accuser && docker attach tzlibre_accuser