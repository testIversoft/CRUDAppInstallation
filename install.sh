export BASEDIR=$HOME/iversoft
export INSTALLDIR=$BASEDIR/installation
export PATH=$PATH:$BASEDIR

mkdir -p $BASEDIR/applications/consul
mkdir -p $BASEDIR/logs
export CONSULDIR=$BASEDIR/applications/consul
export LOGDIR=$BASEDIR/logs
export PATH=$PATH:$CONSULDIR

mkdir -p $BASEDIR/applications/consul_1.0.6
ln -s $BASEDIR/applications/consul_1.0.6 $CONSULDIR

mkdir -p $CONSULDIR/data
mkdir -p $CONSULDIR/conf
cp -R $HOME/crm/installation/applications/consul/ $CONSULDIR/

cp -R $INSTALLDIR/utilites/ $BASEDIR/utilites/

cd $INSTALLDIR/
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     curl -o consul_1.0.6.zip https://releases.hashicorp.com/consul/1.0.6/consul_1.0.6_linux_amd64.zip;;
    Darwin*)    curl -o consul_1.0.6.zip https://releases.hashicorp.com/consul/1.0.6/consul_1.0.6_darwin_amd64.zip;;
    *)          machine="UNKNOWN:${unameOut}"
esac

unzip consul_1.0.6.zip
chmod +x consul

cp consul $CONSULDIR/

rm consul_1.0.6.zip
rm consul

git clone git@github.com:testIversoft/backend.git $BASEDIR/microservices
