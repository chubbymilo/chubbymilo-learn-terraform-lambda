# A learning project of terraform to deploy an S3 bucket and use it to store states a simple Python Lambda

## Set up AWS access
----
In the terminal, use export to set up credentials

``
export AWS_ACCESS_KEY_ID=
``

``
export AWS_SECRET_ACCESS_KEY=
``
## Testing before deployment

In US-West-1

``
./run.sh west-region1 test
``

In US-West-2

``
./run.sh west-region2 test
``

## Deploying a lambda and use S3 bucket to store states

In US-West-1

``
./run.sh west-region1 apply
``

In US-West-2

``
./run.sh west-region2 apply
``

A S3 is created first and a backend configuration file (bucket.tfbackend) is created with the S3's name for Lambda deployment.

## Destroying a lambda in a region

``
./run.sh west-region1 destroy
``

## Destorying all the resources created

``
./run.sh destroy
``

----

<br />
<br />
<br />
<br />

----
## Manual process is shown below:

### Deploying S3
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
terraform output
``
### Deploying Python lambda that uses the S3 above to store states file
----
Replace the bucket name in the backend block under environment/test-west-region1/main.tf

Spin up the Python Lambda in environment/test-west-region1 directory with

``
terraform init
``

``
terraform apply
``

