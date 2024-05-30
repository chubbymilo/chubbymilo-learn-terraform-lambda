#!/bin/sh

backend_configure_path=./bucket.tfbackend
west_region1=west-region1
west_region2=west-region2

if [ "$1" == "destroy" ]; then
    echo "Destroying all created resources"
    cd ./environments/test-west-region1
    terraform destroy -auto-approve
    cd ../test-west-region2 
    terraform destroy -auto-approve
    cd ..
    cd ..
    terraform destroy -auto-approve
    exit 0
fi

terraform init
terraform apply -auto-approve
bucket="bucket = \"$(terraform output -raw s3_name)\""
echo $bucket > $backend_configure_path

if [ "$1" == $west_region1 ]; then
    cd ./environments/test-west-region1
elif [ "$1" == $west_region2 ]; then
    cd ./environments/test-west-region2
fi

if [ "$2" == "destroy" ]; then
    echo "Destroying the lambda in $1"
    terraform destroy -auto-approve
    exit 0
fi

terraform init -backend-config="../.$backend_configure_path" -reconfigure

if [ "$2" == "apply" ]; then
    terraform $2 -auto-approve
    URL=$(terraform output -raw lambda_url)
    RESPONSE=$(curl $URL)

    if [[ $RESPONSE == *"Hello World"* ]]; then
        echo "The Python lambda is deployed successfully"
        echo "URL is: $URL"
        echo "Response from the lambd: $RESPONSE"
    else
        echo "Something went wrong!"
    fi
else
    terraform $2
fi