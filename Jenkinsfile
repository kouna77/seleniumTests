pipeline {
agent {
      label 'test-automation'
}
    stages {
         stage('intialize') {
              steps {
                sh 'echo "PATH= ${PATH}"'
              }
            }
        stage('Execute Tests') {
            steps{
                                sh 'docker run --rm -u root --shm-size=1g -v ${PWD}/reports:/opt/robotframework/reports:Z -v ${PWD}:/opt/robotframework/tests:Z -e ROBOT_THREADS=4 -e PABOT_OPTIONS="--argumentfile /opt/robotframework/tests/chrome_config.txt"  ppodgorsek/robot-framework:latest'
            }
        }
        stage('Proccess Results') {
            steps {
                script{
                    step(
                        [
                            $class              : 'RobotPublisher',
                            outputPath          : 'reports',
                            outputFileName      : "output.xml",
                            reportFileName      : 'report.html',
                            logFileName         : 'log.html',
                            disableArchiveOutput: false,
                            passThreshold       : 95.0,
                            unstableThreshold   : 90.0,
                            otherFiles          : "*.png",
                        ]
                    )
                }
            }
        }
    }
    post {
        always {
                archiveArtifacts  artifacts:  'reports/*.html'
              }
       success {
mail to: "awa.sall2@orange-sonatel.com,ousseynou.sane@orange-sonatel.com,kouna.fall@orange-sonatel.com,ElimaneBoubacar.Kane@orange-sonatel.com", subject: "Succès Pipeline: ${currentBuild.fullDisplayName}", 
body: """
            Test Resut Sauce Lab : https://app.eu-central-1.saucelabs.com/dashboard/tests/vdc
            Lien pipeline : ${env.BUILD_URL}

         """
             }
       failure{
mail to: "awa.sall2@orange-sonatel.com", subject: "Failed Pipeline: ${currentBuild.fullDisplayName}",
 body: """

Lien pipeline : ${env.BUILD_URL}
"""

    }
      cleanup{
              cleanWs()
              }
        }
}
                                                                 
