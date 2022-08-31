+++
title = "python debian package"
description = "creating a debian package (.deb) for a python application"
tags = [
    "projects",
]
date = "2022-08-31"
categories = ["projects"]
draft = true
+++


The below script creates a debian package "hello_0.1-1_amd64.deb", from the Python script 'script.py'.
All dependencies listed in requirements.txt are installed into a fresh virtual environment, and then
a binary is created from the Python script using 'pyinstaller'.


    #!/bin/sh

    NAME="hello"
    SCRIPT_NAME="script.py"
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

