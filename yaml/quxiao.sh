#! /bin/bash
fileName="data.text"

cat $fileName | while read rows
do
  echo "流水号 : ${rows}"
  url="https://uat.whalespay.net/uat-api/whalesPay/quxiao/${rows}"
  # echo $url
  curl -X POST $url
done