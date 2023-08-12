#!/bin/sh -l

export PATH=$PATH:/app/

CURRENT_VERSION=$(over --config $1 get)

echo $CURRENT_VERSION
echo "PACKAGE_VERSION=$CURRENT_VERSION" >> $GITHUB_ENV