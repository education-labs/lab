#!/bin/bash

IP_ADDR=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)

sudo echo "<p>SERVER IP : $IP_ADDR</p>" >> /data/html/index.html

#!/bin/bash

# 1. 디렉토리 존재 확인 및 생성
sudo mkdir -p /data/html

# 2. AWS IMDSv2 토큰 발급 및 IP 가져오기 (GCP/Azure는 방식이 다르니 확인 필요)
TOKEN=$(curl -s -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 60")
IP_ADDR=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/local-ipv4)

# 3. IP 변수가 비어있는지 확인 (예외 처리)
if [ -z "$IP_ADDR" ]; then
    IP_ADDR="Unknown (Check Metadata Service)"
fi

# 4. 안전하게 파일에 추가
echo "<p>SERVER IP : $IP_ADDR</p>" | sudo tee -a /data/html/index.html > /dev/null

echo "작업 완료: /data/html/index.html 확인 필요"
