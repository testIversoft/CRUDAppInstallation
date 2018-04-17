#!/bin/bash
#############################################################################
# kill all applications if they has been started
#############################################################################
if [ "ps -ef | grep consul | grep -v grep | awk '{print $2}' | xargs echo" ]
then
ps -ef | grep consul | grep -v grep | awk '{print $2}' | xargs kill -9
fi
#############################################################################
if [ "ps -ef | grep cassandra | grep -v grep | awk '{print $2}' | xargs echo" ]
then
ps -ef | grep cassandra | grep -v grep | awk '{print $2}' | xargs kill -9
fi
#############################################################################

export BASEDIR=$HOME/iversoft
export INSTALLDIR=$BASEDIR/installation
export CONSULDIR=$BASEDIR/applications/consul
export LOGDIR=$BASEDIR/logs

# remove consul data directory and start it 
rm -rf $CONSULDIR/data
$CONSULDIR/consul agent --data-dir=$CONSULDIR/data --config-dir=$CONSULDIR/conf >> $LOGDIR/consul.log & 

#checking application status
if [ "ps -ef | grep consul | grep -v grep | awk '{print $2}' | xargs echo" ]
then
echo "OK - consul"
fi

cd $BASEDIR/microservices/routerservice
mvn spring-boot:run >> $LOGDIR/routerservice.log &

cd $BASEDIR/microservices/userservice
mvn spring-boot:run >> $LOGDIR/userservice.log &

cd $BASEDIR/ui
npm install
ng serve
