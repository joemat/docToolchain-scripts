#!/bin/bash

CMD="$1"; shift
if [ -z "$CMD" ]
then
    CMD="generateHTML"
fi

FILE_OWNER="$(id -u):$(id -g)"

rm -rf arc42/build


docker run --rm -it --entrypoint /bin/bash \
       -v ${PWD}/arc42:/project rdmueller/doctoolchain:v1.1.0 \
       -c "doctoolchain . $CMD $@ -PinputPath=. \
       -PmainConfigFile=Config.groovy \
       && chown -R $FILE_OWNER /project \
       && exit"

# copy html files to target dir
cp arc42/*.html arc42/build/html5

