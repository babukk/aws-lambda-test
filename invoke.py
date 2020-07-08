
import boto3, json, typing


def invokeLambdaFunction(*, functionName:str=None, payload:typing.Mapping[str, str]=None):

    if functionName == None:
        raise Exception('ERROR: functionName parameter cannot be NULL')

    payloadStr = json.dumps(payload)
    payloadBytesArr = bytes(payloadStr, encoding='utf8')

    client = boto3.client('lambda', region_name='us-east-1')

    response = client.invoke(
        FunctionName=functionName,
        InvocationType="RequestResponse",
        Payload=payloadBytesArr,
    )
    return response


if __name__ == '__main__':
    payloadObj = {"test" : "Hello"}
    response = invokeLambdaFunction(functionName='tmp-dev-hello',  payload=payloadObj)
    print(f'response:{response}')
    print(response['Payload'].read())
