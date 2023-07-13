#!/bin/sh

access=$(aws sts assume-role --role-arn $AWS_ROLE_ARN  --role-session-name $AWS_ROLE_SESSION_NAME)

export AWS_ACCESS_KEY_ID=$(echo $access | jq -r '.Credentials.AccessKeyId')
export IMAGE_DOCKER=$($(IMAGE_DOCKER))

unset access

echo "Variable d'env AWS set"

./gtoken-webhook