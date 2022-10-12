+++
title = "packaging a python script"
description = "packaging a python script as debian package, using pyinstaller and dpkg"
tags = [
    "projects",
]
date = "2022-08-31"
categories = ["projects"]
draft = false
+++


The below script creates a debian package "hello_0.1-1_amd64.deb", from the Python script 'hello.py'.

First, all dependencies listed in requirements.txt are installed into a fresh virtual environment (releaseenv). The required program
'pyinstaller' is also pip-installed.

Next, 'pyinstaller' generates a single binary from the Python script 'hello.py'. The generated binary (dist/hello) can be tested/run locally
prior to packaging.

The final output is a Debian package (.deb), which can be published and installed using 'apt' or 'dpkg':

    sudo dpkg -i {NAME}_${VERSION}-${RELEASE}_amd64.deb

<!-- Could embed this gist, but don't like the appearance -->
<!-- {{< gist malcops c6d63ad85ae1d9406bd3dd29a6a6fca7 >}} -->

    #!/bin/sh

    NAME="hello"
    SCRIPT_NAME="hello.py"
    VERSION="0.1"
    RELEASE="1"

    rm -rf ./build ./dist ./releaseenv
    rm -f ${NAME}.spec
    rm -rf ./*.deb

    python3 -m venv releaseenv
    . releaseenv/bin/activate
    pip3 install -r requirements.txt
    pip3 install pyinstaller
    pyinstaller -y --clean --name ${NAME} --log-level DEBUG --onefile --paths releaseenv/lib/python3.8/site-packages/ ${SCRIPT_NAME}

    MAIN_FOLDER="${NAME}_${VERSION}-${RELEASE}_amd64"
    DEBIAN_FOLDER="${MAIN_FOLDER}/DEBIAN"
    EXEC_FOLDER="${MAIN_FOLDER}/usr/local/bin"

    CONTROL_FILE="${DEBIAN_FOLDER}/control"

    mkdir -p ${MAIN_FOLDER}
    mkdir -p ${DEBIAN_FOLDER}
    mkdir -p ${EXEC_FOLDER}
    touch ${CONTROL_FILE}

    echo "Package: ${NAME}" > ${CONTROL_FILE}
    echo "Version: ${VERSION}" >> ${CONTROL_FILE}
    echo "Architecture: amd64" >> ${CONTROL_FILE}
    echo "Maintainer: Paul Malcolm <paul.malcolm@protonmail.com>" >> ${CONTROL_FILE}
    echo "Description: Brief description of the application" >> ${CONTROL_FILE}

    cp dist/${NAME} ${EXEC_FOLDER}

    dpkg-deb --build --root-owner-group ${MAIN_FOLDER}

    rm -rf ./build ./dist ./releaseenv
    rm -f ${NAME}.spec
    rm -rf ${MAIN_FOLDER}

