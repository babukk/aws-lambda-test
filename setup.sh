#! /bin/sh
#--------------------------------------------------------------------------------------------------------------------------------------------

PROJECT_DIR="."
cd ${PROJECT_DIR}

if [ ! -d .venv3 ]; then
    echo "create virtual env."
    virtualenv -p `which python3` ${PROJECT_DIR}/.venv3/
    . ${PROJECT_DIR}/.venv3/bin/activate
    pip install --upgrade pip
    pip install -r requirements.txt
    pip freeze
else
    . ${PROJECT_DIR}/.venv3/bin/activate
fi

deactivate
