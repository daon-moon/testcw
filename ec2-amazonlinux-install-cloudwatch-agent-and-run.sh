# Install CloudWatch Agent with preconfigure metrics and logs to collect
# Using configuration file hosted on S3

#!/bin/bash

cd /home/ec2-user

CWFILE=/opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl 
if test -f "$CWFILE"; then
    echo "$CWFILE exist"
else
    wget  https://s3.ap-northeast-2.amazonaws.com/amazoncloudwatch-agent-ap-northeast-2/amazon_linux/amd64/latest/amazon-cloudwatch-agent.rpm
    sudo rpm -U ./amazon-cloudwatch-agent.rpm
fi

#wget https://raw.githubusercontent.com/daon-moon/testcw/master/amazon-cloudwatch-agent-linux-1.json     
wget https://hmx-cloudop-share-ext.s3.ap-northeast-2.amazonaws.com/aws-cw-json/hel-sap/hel-linux-com.json
#aws s3 cp s3://hmx-cloudop-fileshare-01/cloudwatch-agent-config/amazon-cloudwatch-agent-mem-linux.json /home/ec2-user/

sleep 7

sudo cp /home/ec2-user/hel-linux-com.json /opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent-linux.json

sudo  /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -m ec2 -a stop

sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c file:/opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent-linux.json -s
