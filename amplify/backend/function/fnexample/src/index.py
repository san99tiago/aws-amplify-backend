import json


def handler(event, context):
    print("received event:")
    print(event)
    message = event.get("arguments").get("message")

    return {
        "statusCode": 200,
        "headers": {
            "Access-Control-Allow-Headers": "*",
            "Access-Control-Allow-Origin": "*",
            "Access-Control-Allow-Methods": "OPTIONS,POST,GET",
        },
        "body": json.dumps(f"Hello from your new Amplify Python lambda! {message}"),
    }
