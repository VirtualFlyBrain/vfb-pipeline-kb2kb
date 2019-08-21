#SERVER=http://host.docker.internal:7474
SERVER=http://kb.p2.virtualflybrain.org

docker pull matentzn/vfb-pipeline-kb2kb
docker run --env=KBpassword=neo4j/neo --env=KBserver=$SERVER matentzn/vfb-pipeline-kb2kb
