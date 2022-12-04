echo "Checking soup-terraform setup ..."
instid=`curl -s -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/instance-id`
#echo $instid
ip=`aws ec2 describe-iam-instance-profile-associations --filters "Name=instance-id,Values=$instid" | jq .IamInstanceProfileAssociations[0].IamInstanceProfile.Arn | cut -f2 -d'/' | tr -d '"'`
#echo $ip
if [ "$ip" != "soup-terraform-admin" ] ; then
echo "ERROR: Could not find Instance profile soup-terraform-admin! - DO NOT PROCEED exiting"
exit
else
echo "PASSED: Found Instance profile soup-terraform-admin - proceed with the workshop"
fi
aws sts get-caller-identity --query Arn | grep soup-terraform-admin -q && echo "PASSED: IAM role valid - soup-terraform-admin" || echo "ERROR: IAM role not valid - DO NOT PROCEED"
iname=$(aws ec2 describe-tags --filters "Name=resource-type,Values=instance" "Name=resource-id,Values=$instid" | jq -r '.Tags[] | select(.Key=="Name").Value')
echo $iname| grep 'soup-terraform\|-Project-mod-' -q && echo "PASSED: Cloud9 IDE name is valid" || echo "ERROR: Cloud9 IDE name invalid! - DO NOT PROCEED"