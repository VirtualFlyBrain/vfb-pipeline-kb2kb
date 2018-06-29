#!/bin/bash

echo "Transform old KB to new schema"

echo 'START' >> ${WORKSPACE}/tick.out
## tail -f ${WORKSPACE}/tick.out >&1 &>&1

cd ${WORKSPACE}/VFB_neo4j
git pull origin master
git checkout ${GITBRANCH}
git pull
cd ..

SCRIPTS=${WORKSPACE}/VFB_neo4j/src/uk/ac/ebi/vfb/neo4j/

echo ''
echo -e "travis_fold:start:neo4j_kb_old2new"
echo '** Validate KB **'
export BUILD_OUTPUT=${WORKSPACE}/KB2KB.out
${WORKSPACE}/runsilent.sh "python3 ${SCRIPTS}neo4j_kb_old2new.py ${KBserver} ${KBuser} ${KBpassword} ${SCRIPTS}data_sig_vfb.csv ${SCRIPTS}property_mapping.csv ${MAXREL}"
cp $BUILD_OUTPUT /logs/
egrep 'Exception|Error|error|exception|warning' $BUILD_OUTPUT
echo -e "travis_fold:end:neo4j_kb_old2new"
