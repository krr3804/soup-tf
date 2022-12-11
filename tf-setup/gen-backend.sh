#!/bin/bash
cp dot-terraform.rc $HOME/.terraformrc
d=`pwd`
sleep 5
reg=`terraform output -json region | jq -r .[]`
if [[ -z ${reg} ]] ; then
    echo "no terraform output variables - exiting ....."
    echo "run terraform init/plan/apply in the the init directory first"
else
    echo "region=$reg"
    rm -f $of $of
fi

#
## using terragrunt for the DRY code might be a better approach than the below -
#

mkdir -p generated

#default=["net","iam","c9net","cluster","nodeg","cicd","eks-cidr"]
SECTIONS=('net' 'iam' 'c9net' 'maint' 'cluster' 'nodeg' 'lb' 'efs' 'tool-apps')
 
for section in "${SECTIONS[@]}"
do

    tabn=`terraform output dynamodb_table_name_$section | tr -d '"'`
    s3b=`terraform output -json s3_bucket | jq -r .[]`
    echo $s3b $tabn

    cd $d

    of=`echo "generated/backend-${section}.tf"`
    # vf=`echo "generated/vars-${section}.tf"`

    # write out the backend config 
    printf "" > $of
    printf "terraform {\n" >> $of
    printf "required_version = \"~> 1.3.0\"\n" >> $of
    printf "required_providers {\n" >> $of
    printf "  aws = {\n" >> $of
    printf "   source = \"hashicorp/aws\"\n" >> $of
    printf "#  Lock version to avoid unexpected problems\n" >> $of
    printf "   version = \"4.31.0\"\n" >> $of
    printf "  }\n" >> $of
    printf "  kubernetes = {\n" >> $of
    printf "   source = \"hashicorp/kubernetes\"\n" >> $of
    printf "   version = \"2.13.1\"\n" >> $of
    printf "  }\n" >> $of
    printf "  kubectl = {\n" >> $of
    printf "   source = \"gavinbunney/kubectl\"\n" >> $of
    printf "   version = \">= 1.7.0\"\n" >> $of
    printf "  }\n" >> $of
    printf " }\n" >> $of
    printf "backend \"s3\" {\n" >> $of
    printf "bucket = \"%s\"\n"  $s3b >> $of
    printf "key = \"terraform/%s.tfstate\"\n"  $tabn >> $of
    printf "region = \"%s\"\n"  $reg >> $of
    printf "dynamodb_table = \"%s\"\n"  $tabn >> $of
    printf "encrypt = \"true\"\n"   >> $of
    printf "}\n" >> $of
    printf "}\n" >> $of
    ##
    printf "provider \"aws\" {\n" >> $of
    printf "region = var.region\n"  >> $of
    printf "shared_credentials_files = [\"~/.aws/credentials\"]\n" >> $of
    printf "profile = var.profile\n" >> $of
    printf "}\n" >> $of

    # copy the files into place
    ln -s ~/environment/soup-tf-code/tf-setup/$of ~/environment/soup-tf-code/$section
    # link these
    ln  -s ~/environment/soup-tf-code/tf-setup/aws-data.tf ~/environment/soup-tf-code/$section
    ln  -s ~/environment/soup-tf-code/tf-setup/vars-dynamodb.tf ~/environment/soup-tf-code/$section
    ln  -s ~/environment/soup-tf-code/tf-setup/vars-main.tf ~/environment/soup-tf-code/$section
    ln  -s ~/environment/soup-tf-code/tf-setup/var-tfid.tf ~/environment/soup-tf-code/$section
done

# next generate the remote_state config files 


cd $d
echo "**** REMOTE ****"

RSECTIONS=('net' 'iam' 'c9net' 'cluster' 'efs' 'lb') 
for section in "${RSECTIONS[@]}"
do
    tabn=`terraform output dynamodb_table_name_$section | tr -d '"'`
    s3b=`terraform output -json s3_bucket | jq -r .[]`

    echo $s3b $tabn
    of=`echo "generated/remote-${section}.tf"`
    printf "" > $of

    # write out the remote_state terraform files
    printf "data terraform_remote_state \"%s\" {\n" $section>> $of
    printf "backend = \"s3\"\n" >> $of
    printf "config = {\n" >> $of
    printf "bucket = \"%s\"\n"  $s3b >> $of
#    printf "region = \"%s\"\n"  $reg >> $of
    printf "region = var.region\n"  >> $of
    printf "key = \"terraform/%s.tfstate\"\n"  $tabn >> $of
    printf "}\n" >> $of
    printf "}\n" >> $of
done

echo "remotes"

# put in place remote state access where required
ln  -s ~/environment/soup-tf-code/tf-setup/generated/remote-net.tf ~/environment/soup-tf-code/c9net 
ln  -s ~/environment/soup-tf-code/tf-setup/generated/remote-net.tf ~/environment/soup-tf-code/cluster
ln  -s ~/environment/soup-tf-code/tf-setup/generated/remote-net.tf ~/environment/soup-tf-code/nodeg
ln  -s ~/environment/soup-tf-code/tf-setup/generated/remote-net.tf ~/environment/soup-tf-code/maint
ln  -s ~/environment/soup-tf-code/tf-setup/generated/remote-net.tf ~/environment/soup-tf-code/efs
ln  -s ~/environment/soup-tf-code/tf-setup/generated/remote-net.tf ~/environment/soup-tf-code/tool-apps/kubernetes_resources
#cp  -v generated/remote-net.tf ../extra/.fargate

#cp  -v generated/remote-nodeg.tf ../extra/.karpenter

ln  -s ~/environment/soup-tf-code/tf-setup/generated/remote-iam.tf ~/environment/soup-tf-code/cluster 
ln  -s ~/environment/soup-tf-code/tf-setup/generated/remote-iam.tf ~/environment/soup-tf-code/nodeg

echo "Copy remote-cluster.tf"
ln  -s ~/environment/soup-tf-code/tf-setup/generated/remote-cluster.tf ~/environment/soup-tf-code/nodeg
ln  -s ~/environment/soup-tf-code/tf-setup/generated/remote-cluster.tf ~/environment/soup-tf-code/lb
ln  -s ~/environment/soup-tf-code/tf-setup/generated/remote-cluster.tf ~/environment/soup-tf-code/efs
ln  -s ~/environment/soup-tf-code/tf-setup/generated/remote-cluster.tf ~/environment/soup-tf-code/tool-apps/elasticsearch
ln  -s ~/environment/soup-tf-code/tf-setup/generated/remote-cluster.tf ~/environment/soup-tf-code/tool-apps/mysql
ln  -s ~/environment/soup-tf-code/tf-setup/generated/remote-cluster.tf ~/environment/soup-tf-code/tool-apps/argocd

echo "Copy remote-efs.tf"
ln  -s ~/environment/soup-tf-code/tf-setup/generated/remote-efs.tf ~/environment/soup-tf-code/tool-apps/elasticsearch
ln  -s ~/environment/soup-tf-code/tf-setup/generated/remote-efs.tf ~/environment/soup-tf-code/tool-apps/mysql
#cp  -v generated/remote-cluster.tf ../extra/.fargate

# Prepare "local state" for the sample app and extra activities
#cp  aws.tf ../sampleapp
echo "Copy vars/aws.tf"

#link

cd ~/environment/soup-tf-code
terraform fmt --recursive > /dev/null
exit 0