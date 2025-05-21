#!/bin/bash

# Define output file
OUTPUT_FILE="/home/nik/Desktop/ec2-running-instances.log"

# Get current date and time
echo "------ $(date) ------" >> $OUTPUT_FILE

# Run AWS CLI command to list running EC2 instances
aws ec2 describe-instances \
  --filters "Name=instance-state-name,Values=running" \
  --query "Reservations[*].Instances[*].{ID:InstanceId,Type:InstanceType,IP:PublicIpAddress,Name:Tags[?Key=='Name']|[0].Value}" \
  --output table >> $OUTPUT_FILE

echo -e "\n" >> $OUTPUT_FILE

