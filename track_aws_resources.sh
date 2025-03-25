#!/bin/bash

# Author: Riya Gupta
# Date: 25/03/2025
# Version: 1.0
# Purpose: Track AWS resource usage and generate a daily report

# Enable debugging (optional)
#set -x

# Set output file
REPORT_FILE="aws_resources_report_$(date +"%Y-%m-%d").txt"

# Ensure AWS CLI is installed
if ! command -v aws &> /dev/null; then
    echo "AWS CLI is not installed. Please install it first."
    exit 1
fi

# Ensure jq is installed
if ! command -v jq &> /dev/null; then
    echo "jq is not installed. Please install it first."
    exit 1
fi

# Fetch AWS Account ID
AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query "Account" --output text)

# Start writing the report
echo "AWS Resources Report - $(date)" > $REPORT_FILE
echo "===================================" >> $REPORT_FILE
echo "AWS Account ID: $AWS_ACCOUNT_ID" >> $REPORT_FILE
echo "" >> $REPORT_FILE

# Fetch EC2 Instances
echo "Fetching EC2 Instances..."
echo "EC2 Instances:" >> $REPORT_FILE
aws ec2 describe-instances --query "Reservations[].Instances[].{ID:InstanceId,State:State.Name,Type:InstanceType,Region:Placement.AvailabilityZone}" --output table >> $REPORT_FILE
echo "" >> $REPORT_FILE

# Fetch S3 Buckets
echo "Fetching S3 Buckets..."
echo "S3 Buckets:" >> $REPORT_FILE
aws s3api list-buckets --query "Buckets[].Name" --output table >> $REPORT_FILE
echo "" >> $REPORT_FILE

# Fetch Lambda Functions
echo "Fetching Lambda Functions..."
echo "Lambda Functions:" >> $REPORT_FILE
aws lambda list-functions --query "Functions[].FunctionName" --output table >> $REPORT_FILE
echo "" >> $REPORT_FILE

# Fetch IAM Users
echo "Fetching IAM Users..."
echo "IAM Users:" >> $REPORT_FILE
aws iam list-users --query "Users[].UserName" --output table >> $REPORT_FILE
echo "" >> $REPORT_FILE

# Print completion message
echo "AWS resource report generated: $REPORT_FILE"

# Disable debugging
#set +x
