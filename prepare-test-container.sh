#!/bin/bash

set -eEuo pipefail

# docker run -d -t --name paperless-test -v $(pwd):/paperless ubuntu:focal /bin/bash
# docker exec -it paperless-test /bin/bash

apt update
apt install --no-install-recommends --assume-yes python3 python3-pip python3-dev fonts-liberation gnupg libpq-dev libmagic-dev mime-support unpaper tesseract-ocr imagemagick ghostscript optipng

pip install --upgrade pipenv
cd /paperless
pipenv install --system --dev --ignore-pipfile

adduser --disabled-login --gecos "" nonroot

su nonroot
