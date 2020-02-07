#!/bin/bash

INIT_CMD="$1"
if [ -z "$INIT_CMD" ]
then
    INIT_CMD="initArc42EN"
fi

FILE_OWNER="$(id -u):$(id -g)"

docker run --rm -it --entrypoint /bin/bash \
       -v ${PWD}/arc42:/project rdmueller/doctoolchain:v1.1.0 \
       -c "cd /docToolchain; ./gradlew -b init.gradle $INIT_CMD -PnewDocDir=/project \
       && chown -R $FILE_OWNER /project \
       && exit"

# configure docinfo and toclevel to customize TOC
sed -i -e 's#:toc-title:#:docinfo: shared\n:toclevels: 3\n:toc-title:#g' arc42/arc42-template.adoc

# copy html files for customized TOC and index.html
cp html/*.html arc42/
