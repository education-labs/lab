#!/bin/bash

sudo apt update -y
sudo apt install -y nginx
sudo systemctl start nginx
sudo systemctl enable nginx

#AWS IMDSv2 토큰 발급 및 IP 가져오기 (GCP/Azure는 방식이 다르니 확인 필요)
TOKEN=$(curl -s -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 60")
IP_ADDR=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/local-ipv4)

# IP 변수가 비어있는지 확인 (예외 처리)
if [ -z "$IP_ADDR" ]; then
    IP_ADDR="Unknown (Check Metadata Service)"
fi

sudo rm -rf /var/www/html/*
sudo chown -R ubuntu:ubuntu /var/www
sudo chmod 2775 /var/www

sudo echo "<h1>HELLO</h1> <p>SERVER IP : $IP_ADDR</p> " >> /var/www/html/index.html
sudo chown -R root:root /var/www
