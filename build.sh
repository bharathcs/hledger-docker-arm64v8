#!/bin/bash
set -e
v=1.33
docker image build -t bharathcs/hledger-arm64v8:latest-dev -t bharathcs/hledger-arm64v8:${v}-dev --target dev .
docker image build -t bharathcs/hledger-arm64v8:latest -t bharathcs/hledger-arm64v8:${v} .

./run.sh ./data/hledger.journal hledger print || { echo "failed to run container, aborting"; exit 1; }

docker image push bharathcs/hledger-arm64v8:${v}-dev
docker image push bharathcs/hledger-arm64v8:latest-dev
docker image push bharathcs/hledger-arm64v8:${v}
docker image push bharathcs/hledger-arm64v8:latest
echo ./update_readme.sh
echo docker pushrm bharathcs/hledger-arm64v8
