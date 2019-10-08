source ./env.sh
rc=$?
if [ ! $rc == 0 ]; then
  echo "ERROR: missing env.sh"
  exit 1
fi

ERR_MSG="ERROR: parm must = '$NODE1' or '$NODE2'"
if [ ! $# == 1 ]; then
  echo $ERR_MSG
  exit 1
fi
if [ ! "$1" == "$NODE1" ] && [ ! "$1" == "$NODE2" ]; then
  echo $ERR_MSG
  exit 1
fi

NODE=$1
echo '$NODE' | sudo tee -a /etc/hostname
sudo hostnamectl set-hostname $NODE

sudo yum update -y

