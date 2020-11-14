#!/usr/bin/env bash

TAG=cssc_builder
NAME=cssc
BASE_PATH="/tmp/$NAME"

echo "Building docker image"
docker build . -t $TAG

echo "Copying executable from built container"
docker create --name $TAG $TAG

mkdir -p $BASE_PATH
docker cp $TAG:/$NAME.jar $BASE_PATH/$NAME.jar
docker rm $TAG

cat >$BASE_PATH/stub.sh <<'EOF'
#!/bin/sh
MYSELF=$(which "$0" 2>/dev/null)
[ $? -gt 0 -a -f "$0" ] && MYSELF="./$0"
java=java
if test -n "$JAVA_HOME"; then
    java="$JAVA_HOME/bin/java"
fi
java_args=-Xmx1g
exec "$java" $java_args -jar $MYSELF "$@"
exit 1
EOF

cat $BASE_PATH/stub.sh $BASE_PATH/$NAME.jar >$BASE_PATH/cssc && chmod +x $BASE_PATH/cssc

mv $BASE_PATH/$NAME ./alfred/$NAME
zip -r -j CSSC.alfredworkflow alfred/*

rm -rf $BASE_PATH
echo 1
