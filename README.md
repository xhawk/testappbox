testappbox
==========

Chef config for vagrant and aws and vagrant environment

Installation
------------

- git clone [this repo]
- cd testappbox
- librarian-chef install
- 

## run

- add ssh to security group
- create server
knife ec2 server create --flavor=t1.micro -S ec2eu -I ami-e0b51497 -i ec2eu.pem

- prepare vm
knife solo prepare ec2-54-76-181-2.eu-west-1.compute.amazonaws.com -i ec2eu.pem

- install cookbooks
knife solo cook ec2-54-72-40-146.eu-west-1.compute.amazonaws.com -i ec2eu.pem

- prepare and install
knife solo bootstrap -i ec2eu.pem ec2-54-72-40-146.eu-west-1.compute.amazonaws.com

## links
- http://markbirbeck.com/blog/2012/03/16/using-knife-to-launch-ec2-instances-without-a-chef-server/
- http://www.captnswing.net/2013/01/from-vagrant-to-ec2-with-knife-solo.html

