source ./env.sh
rc=$?
if [ ! $rc == 0 ]; then
  echo "ERROR: missing env.sh"
  exit 1
fi

ERR_MSG="ERROR: parm must = '$DRIVER1' or '$DRIVER2'"
if [ ! $# == 1 ]; then
  echo $ERR_MSG
  exit 1
fi
if [ ! "$1" == "$DRIVER1" ] && [ ! "$1" == "$DRIVER2" ]; then
  echo $ERR_MSG
  exit 1
fi

DRIVER=$1
echo '$DRIVER' | sudo tee -a /etc/hostname
sudo hostnamectl set-hostname $DRIVER
sudo sh -c " \
cat << EOF >> /etc/hosts
$NODE1_IP  $NODE1
$NODE2_IP  $NODE2
EOF
"

cd $HOME
sudo yum install -y git
mkdir test
mkdir test/data
cd test
git clone https://github.com/bigsql/bigsql2

sudo yum install -y net-tools zip unix2dos wget git python-setuptools bzip2 pbzip2 awscli java-1.8.0-openjdk java-1.8.0-openjdk-devel openssh-server python-pip

#sudo pip install --upgrade pip
sudo pip install pssh

git config --global user.email "denisl@oscg-partners.com"
git config --global user.name  "denis lussier"
git config credential.helper store
git config --global credential.helper "cache --timeout 7200"

cd $HOME
ANT=apache-ant-1.9.14-bin
rm -f $ANT.tar.gz
wget http://mirror.olnevhost.net/pub/apache//ant/binaries/$ANT.tar.gz
tar xf $ANT.tar.gz
rm $ANT.tar.gz

echo ""
echo "###### appending ~/.bashrc"
cat << 'EOF' >> ~/.bashrc 
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk
export PATH=$PATH:$JAVA_HOME/bin

export ANT_HOME=$HOME/apache-ant-1.9.14
export PATH=$ANT_HOME/bin:$PATH

export RMT=$HOME/test/bigsql/lmm/remote
EOF

cd $HOME
if [ ! -d bigsql ]; then
  python -c "$(curl -fsSL https://bigsql-download.s3.amazonaws.com/REPO/install.py)"
  cd bigsql
  ./apg install pg11
  ./apg start pg11 -y
  ./apg stop pg11
fi

echo ""
echo "###### writing ~/.pgpass"
cat << EOF >> ~/.pgpass
$NODE1:5432:*:postgres:password
$NODE1_IP:5432:*:postgres:password
$NODE2:5432:*:postgres:password
$NODE2_IP:5432:*:postgres:password
EOF
chmod 600 ~/.pgpass

cd $HOME
ssh-keygen -t rsa
echo "## append this key in server ~/.ssh/authorized_keys ##"
cat ~/.ssh/id_rsa.pub

