set -e

script_location=$(pwd)

curl -sL https://rpm.nodesource.com/setup_lts.x | bash
yum install nodejs -y
#useradd roboshop
mkdir -p /app 
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip 
rm -rf /app/*
cd /app 
npm install

cp ${script_location}/files/catalogue.service /etc/systemd/system/catalogue.service
unzip /tmp/catalogue.zip
systemctl daemon-reload
systemctl enable catalogue 
systemctl start catalogue