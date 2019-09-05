PSSH="pssh -i -h hosts"

$PSSH 'python -c "$(curl -fsSL https://s3.amazonaws.com/pgcentral/install.py)"'

