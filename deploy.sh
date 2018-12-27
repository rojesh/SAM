#!/bin/bash

PROJECT=SAM-ROJACE

BUCKET=$PROJECT-playground

rm -rf build
mkdir build

aws s3 mb s3://$BUCKET 

aws cloudformation package                   \
    --template-file template.yaml            \
    --output-template-file build/output.yaml \
    --s3-bucket $BUCKET                      

aws cloudformation deploy                     \
    --template-file build/output.yaml         \
    --stack-name $PROJECT                     \
    --capabilities CAPABILITY_IAM             
