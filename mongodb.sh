
cp /home/centos/roboshop/files/mongodb.repo /etc/yum.repos.d/mongodb.repo
yum install mongodb-org -y 

systemctl enable mongod 
systemctl start mongod 

