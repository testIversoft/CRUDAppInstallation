ps -ef | grep consul | grep -v grep | awk '{print $2}' | xargs kill -9
ps -ef | grep userservice | grep -v grep | awk '{print $2}' | xargs kill -9
ps -ef | grep routerservice | grep -v grep | awk '{print $2}' | xargs kill -9
