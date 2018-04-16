# stop consul
ps -ef | grep consul | grep -v grep | awk '{print $2}' | xargs kill -9

