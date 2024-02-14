export V_WORKSPACE=$1
export V_BRANCH_NAME=$2 

echo "WORKSPACE is ${V_WORKSPACE}" > ${V_WORKSPACE}/deployment.log
echo "WORKSPACE is ${V_BRANCH_NAME}" >>  ${V_WORKSPACE}/deployment.log


echo "Here We will do openshift deployment using yaml configs" >>   ${V_WORKSPACE}/deployment.log

echo "oc apply -f deployment.yaml" >>  ${V_WORKSPACE}/deployment.log

