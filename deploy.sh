#!/bin/bash

PROJECT=rojace-sam

BUCKET=$PROJECT-playground

PROFILE=training

rm -rf build
mkdir build

aws s3 mb s3://$BUCKET --profile $PROFILE

aws cloudformation package                   \
    --template-file template.yaml            \
    --output-template-file build/output.yaml \
    --s3-bucket $BUCKET  										 \
    --profile $PROFILE                    

aws cloudformation deploy                     \
    --template-file build/output.yaml         \
    --stack-name $PROJECT                     \
    --capabilities CAPABILITY_IAM             \
    --profile $PROFILE             
