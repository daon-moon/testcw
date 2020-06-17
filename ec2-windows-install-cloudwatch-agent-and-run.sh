<powershell>

cd C:\Users\Administrator

wget https://s3.ap-northeast-2.amazonaws.com/amazoncloudwatch-agent-ap-northeast-2/windows/amd64/latest/amazon-cloudwatch-agent.msi -OutFile ./amazon-cloudwatch-agent.msi

msiexec /i amazon-cloudwatch-agent.msi

wget https://raw.githubusercontent.com/daon-moon/testcw/master/amazon-cloudwatch-agent-mem-windows.json -OutFile ./amazon-cloudwatch-agent-mem-windows.json

cp -Path "C:\Users\Administrator\amazon-cloudwatch-agent-mem-windows.json" -Destination "C:\Program Files\Amazon\AmazonCloudWatchAgent\amazon-cloudwatch-agent-mem-windows.json"

& "C:\Program Files\Amazon\AmazonCloudWatchAgent\amazon-cloudwatch-agent-ctl.ps1" -m ec2 -a stop

& "C:\Program Files\Amazon\AmazonCloudWatchAgent\amazon-cloudwatch-agent-ctl.ps1" -a fetch-config -m ec2 -c file:"C:\Program Files\Amazon\AmazonCloudWatchAgent\amazon-cloudwatch-agent-mem-windows.json" -s

</powershell>



