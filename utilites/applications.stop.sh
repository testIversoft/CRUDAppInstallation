# stop consul
ps -ef | grep consul | grep -v grep | awk '{print $2}' | xargs kill -9
ps -ef | grep UserManagementService | grep -v grep | awk '{print $2}' | xargs kill -9
ps -ef | grep RouterService | grep -v grep | awk '{print $2}' | xargs kill -9
