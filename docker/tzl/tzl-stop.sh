cd /opt/tzlibre
docker-compose -f composes/docker-compose-betanet.yml stop accuser
docker-compose -f composes/docker-compose-betanet.yml stop endorser
docker-compose -f composes/docker-compose-betanet.yml stop baker
docker-compose -f composes/docker-compose-betanet.yml stop node
find /var/lib/docker/containers/ -type f -name "*.log" -delete