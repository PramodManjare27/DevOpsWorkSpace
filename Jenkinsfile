pipeline {
    agent any
	 options {
        disableConcurrentBuilds()
    }
    stages {
        stage('checkout validations') {
			when {
	            allOf {
				expression { BRANCH_NAME ==~ /(feature\/orbit_bank_ui_[0-9][0-9]_.*$|orbit_bank_ui_[0-9][0-9]|bugfix\/orbit_bank_ui_[0-9][0-9]_.*$)/ }
				expression { BUILD_NUMBER != '1'}
				      }
				}
			steps {
                echo "checkout of scm at ${WORKSPACE}"
			    echo "Branch name is ${BRANCH_NAME}"
				echo "Build number is ${BUILD_NUMBER}"
		        bat "set PATH=C:\\Program Files\\Git\\;%PATH% && git-bash.exe C:\\Users\\hp\\GIT_CHECKOUT\\checkout_validation.sh ${WORKSPACE} ${BRANCH_NAME} ${BUILD_NUMBER}"
				
				echo "checkout validation logs are as below :"
				script {
				     def validate_logs = readFile(file: 'validate.log')
                     println(validate_logs)
					  def data = readFile(file: 'failure_checkout.log').trim()
                      println(data)
					  if (data == 'Y') {
                        echo 'Failed in checkout validations.. exiting'
						error "Checkout Validation Stage has failed..."
                    } else {
                        echo 'Suceeded in checkout validations.. proceeding with next stage...'
                    }
				       }
    				}
        }
        stage('PodMan Build and Dockerhub Push') {
			when {
	            allOf {
				expression { BRANCH_NAME ==~ /(feature\/orbit_bank_ui_[0-9][0-9]_.*$|orbit_bank_ui_[0-9][0-9]|bugfix\/orbit_bank_ui_[0-9][0-9]_.*$)/ }
				expression { BUILD_NUMBER != '1'}
				      }
				}
           steps {
                echo 'running build.sh'
                bat "set PATH=C:\\Program Files\\Git\\;%PATH% && git-bash.exe C:\\Users\\admin\\GIT_CHECKOUT\\build_processing.sh ${WORKSPACE} ${BRANCH_NAME}"
				echo "build logs are as below :"
				script {
				   def build_log = readFile(file: 'build.log')
                   println(build_log)
				}
                 }
        }

        stage('Openshift Deployment') {
			when {
	            allOf {
				expression { BRANCH_NAME ==~ /(feature\/orbit_bank_ui_[0-9][0-9]_.*$|orbit_bank_ui_[0-9][0-9]|bugfix\/orbit_bank_ui_[0-9][0-9]_.*$)/ }
				expression { BUILD_NUMBER != '1'}
				      }
				}
           steps {
                echo 'running openshift_deploy.sh'
                bat "set PATH=C:\\Program Files\\Git\\;%PATH% && git-bash.exe C:\\Users\\admin\\GIT_CHECKOUT\\openshift_deploy.sh ${WORKSPACE} ${BRANCH_NAME}"
				echo "deployment logs are as below :"
				script {
				   def artifact_log = readFile(file: 'deployment.log')
                   println(deployment)
				}
                 }
        }
    }

    post {
        // Cleanup the workspace after build
        always {
            cleanWs(cleanWhenNotBuilt: true,
                    deleteDirs: true,
                    disableDeferredWipeout: true,
                    notFailBuild: true)
        }
    }
}
