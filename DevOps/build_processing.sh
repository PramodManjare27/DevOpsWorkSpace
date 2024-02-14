export V_WORKSPACE=$1
export V_BRANCH_NAME=$2 

echo "WORKSPACE is ${V_WORKSPACE}" > ${V_WORKSPACE}/build.log
echo "WORKSPACE is ${V_BRANCH_NAME}" >>  ${V_WORKSPACE}/build.log


echo "Here we will call PodMan build commands based on dockerfile"  >>  ${V_WORKSPACE}/build.log

echo "podman build dockerfile"  >>  ${V_WORKSPACE}/build.log
echo "podman push image"  >>  ${V_WORKSPACE}/build.log
