PSSH="pssh -i -h hosts"

$PSSH 'python -c "$(curl -fsSL https://bigsql-download.s3.amazonaws.com/REPO/install.py)"'

