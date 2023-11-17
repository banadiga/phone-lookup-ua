#!/bin/bash

if [ -z "$1" ]
  then
    echo "No argument supplied. Provide version"
fi

echo "Build banadiga/phone-lookup-ua:$1 ..."

docker build -t banadiga/phone-lookup-ua:$1 .
docker build -t banadiga/phone-lookup-ua:latest .

docker images | grep banadiga

docker push banadiga/phone-lookup-ua:$1
docker push banadiga/phone-lookup-ua:latest
