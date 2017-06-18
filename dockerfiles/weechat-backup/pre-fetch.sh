#! /bin/sh

export S3_BUCKET=`cat /secrets/s3-bucket`
export AWS_ACCESS_KEY_ID=`cat /secrets/access-key-id`
export AWS_SECRET_ACCESS_KEY=`cat /secrets/secret-access-key`

# at startup we only pull down the logs for *today* since they're the only ones
# we might need to append to
DATE_PATH=`date +%Y/%m/%d`
mkdir -p "/weechat-logs/${DATE_PATH}"
aws s3 sync "s3://${S3_BUCKET}/${DATE_PATH}" "/weechat-logs/${DATE_PATH}"
