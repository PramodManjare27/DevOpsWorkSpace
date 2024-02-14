export V_WORKSPACE=$1
export V_BRANCH_NAME=$2 
export V_BUILD_NUMBER=$3

echo "WORKSPACE is ${V_WORKSPACE}" > ${V_WORKSPACE}/validate.log
echo "WORKSPACE is ${V_BRANCH_NAME}" >>  ${V_WORKSPACE}/validate.log
echo "WORKSPACE is ${V_BUILD_NUMBER}" >>  ${V_WORKSPACE}/validate.log

echo "N" > ${V_WORKSPACE}/failure_checkout.log