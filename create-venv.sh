#!/bin/bash

mkdir -p $1 

cd $1

mkdir -p $1 

mkdir -p venv/

pip3 install virtualenv

virtualenv -p /usr/bin/python3 venv/
