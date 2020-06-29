cd /opt/tzlibre
docker-compose -f composes/docker-compose-betanet.yml up -d baker && docker attach tzlibre_baker