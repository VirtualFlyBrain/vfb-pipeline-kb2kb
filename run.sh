docker pull matentzn/vfb-pipeline-kb2kb
docker run --env=KBpassword=neo4j/neo --env=KBserver=http://host.docker.internal:7474 matentzn/vfb-pipeline-kb2kb
