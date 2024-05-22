# A learning project of terraform to deploy an S3 bucket and use it to store states of deploying a simple Python lambda in different regions.

## Set up AWS access
----
In the terminal, use export to set up credentials

``
export AWS_ACCESS_KEY_ID=
``

``
export AWS_SECRET_ACCESS_KEY=
``

## Deploying S3
----
Navigate to the root directory

``
terraform init
``

``
terraform apply
``

Find out the S3 bucket's name with
``
terraform show
``
## Deploying Python lambda that uses the S3 above to store states file
----
Replace the bucket name in the backend block under environment/test-west-region1/main.tf

Spin up the Python lambda in environment/test-west-region1 directory with

``
terraform init
``

``
terraform apply
``

