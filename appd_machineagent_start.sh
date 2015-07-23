JAVA_HOME=/opt/appdynamics/jdk/appd_jdk/bin
APPD_MA_HOME=/opt/appdynamics/machineagent
HOSTNAME=`hostname`

#For stand alone machine agents uncomment tier and add the -Dappdynamics... line
#below after the access key
#TIER="Couchbase"
#-Dappdynamics.agent.tierName="$TIER" 
APPD_APP_NAME="Expense Middle Tier - Batch"

$JAVA_HOME/java -Dappdynamics.controller.hostName=concur.saas.appdynamics.com -Dappdynamics.controller.port=80 -Dappdynamics.controller.ssl.enabled=false -Dappdynamics.agent.applicationName="$APPD_APP_NAME" -Dappdynamics.agent.accountName=concur -Dappdynamics.agent.accountAccessKey=aaf1943ebb92 -Dappdynamics.agent.nodeName=$HOSTNAME -jar $APPD_MA_HOME/machineagent.jar &

exit 0
