Dockerize a simple PHP application and deploy it on an AWS EC2 instance. This application will interact with a MySQL database hosted on AWS RDS

| AWS CLOUD
|  - EC2 instance
|  - RDS db setup
|  - sample git repo with php application containing docker file.
|  - ECR registery for storing the docker images

                 +----------------------------------------+
                 |              AWS Cloud                  |
                 +----------------------------------------+
                           |                  |
             +-------------+                  +-----------------+
             |                                                    |
             |            EC2 Instance                             |
             |                                                    |
             +--+---------------------------------------------+----+
                |         Dockerized PHP Application          |
                |                                             |
                +-------------+----------------------+--------+
                              |                      |
                  +-----------+                      +------------+
                  |                                               |
                  |               AWS RDS                         |
                  |                                               |
                  +-----------------------------------------------+

create a git repository with the mentioned below files
ref: https://github.com/Subhan70/php_application
  1. index.php
  2. sample.php 
  3. db.inc.php  -->for storing the url and username of db (can place this env variables)
  4. Dockerfile  --> for containerizing the php application.
  5. buildspec.yml --> for aws code build
  6. appsec.yml --> for aws code deploy

**PRE-REQUSITES**
launch an ec2 instance.
create a rds db with sql  ( maintian ec2 and db are in same network security group, or else add the required ports in the inbound rules of connecting each other).

login to ec2 instance with ssh -i <path to pemfile> awsuser@ip
**do the following commands for manual deployment**
  - sudo apt-get update
  - sudo apt install docker.io
  - first check connectivity to rds db by using telnet <endpt id> 3306
  - if not establish the connection
  - after manually login to the db by using following command
  -  mysql -u <username> -h endpt id -p
  -  create the db manually which wee mention in the db.inc.php file
  -  docker build -t <tag-name> -f Dockerfile .  (by using this build the docker image)
  -  docker images
  -  docker ps
  -  docker run -d -p 80:80 --name <container-name> image-name
  -  docker ps --> for checking the containers which are running

for accessing through internet,go to instance settings and copy the publicip and mention the port number
   public_ip: portnumber

by this we have deployed our php application succesfully on ec2 instance .
