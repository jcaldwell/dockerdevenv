#! /bin/bash

set -e

git submodule update --init --recursive
cd osbase
echo "Building jcaldwell/osbase"
docker build -t jcaldwell/osbase .
docker push jcaldwell/osbase

cd ../commandbase
echo "Building jcaldwell/commandbase"
docker build -t jcaldwell/commandbase .
docker push jcaldwell/commandbase

cd ../uibase
echo "Building jcaldwell/uibase"
docker build -t jcaldwell/uibase .
docker push jcaldwell/uibase

cd ../useradd
echo "Building jcaldwell/useradd"
docker build -t jcaldwell/useradd .
docker push jcaldwell/useradd

cd ../devenv 
echo "Building jcaldwell/devenv"
docker build -t jcaldwell/devenv .
docker push jcaldwell/devenv

cd ..

