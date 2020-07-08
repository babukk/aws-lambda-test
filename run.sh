#! /bin/sh
#--------------------------------------------------------------------------------------------------------------------------------------------

. ./.aws

PROJECT_DIR="."
cd ${PROJECT_DIR}

if [ ! -d .venv3 ]; then
    exit 1
else
    . ${PROJECT_DIR}/.venv3/bin/activate
fi

python invoke.py

exit

aws lambda invoke \
    --function-name tmp-dev-hello \
    --region us-east-1 \
    response.json
