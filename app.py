import json


def lambda_test(event, context):
    return {
        'statusCode': 200,
        'body': json.dumps('Hello World')
        }
