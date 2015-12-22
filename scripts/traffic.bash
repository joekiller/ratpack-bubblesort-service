#!/usr/bin/env bash

export TARGET_HOST=

traffic () {
    while true; do
        n1=$[ ( $RANDOM % 10 )  + 1 ]
        n2=$[ ( $RANDOM % 10 )  + 1 ]
        n3=$[ ( $RANDOM % 10 )  + 1 ]
        n4=$[ ( $RANDOM % 10 )  + 1 ]
        if [ $[ ( $RANDOM % 10 )  + 1 ] -eq 1 ]; then
            n4=blah
        fi
        echo -n "[${n1},${n2},${n3},${n4}] -> "
        echo $(curl -s -X POST -H "Content-Type: application/json" -H "Cache-Control: no-cache" -d "[${n1},${n2},${n3},${n4}]" ${TARGET_HOST}'/sort')
    done
}

bakepie () {
    echo $(curl -s -X GET -H "Content-Type: application/json" -H "Cache-Control: no-cache" ${TARGET_HOST}'/bakepie')
}

stoppie () {
    echo $(curl -s -X GET -H "Content-Type: application/json" -H "Cache-Control: no-cache" ${TARGET_HOST}'/stoppie')
}

bomb () {
    echo $(curl -s -X GET -H "Content-Type: application/json" -H "Cache-Control: no-cache" ${TARGET_HOST}'/armbomb')
}

healthcheck () {
    echo $(curl -s -X GET -H "Content-Type: application/json" -H "Cache-Control: no-cache" ${TARGET_HOST}'/')
}
start () {
    echo "Run the following you silly goose."
    echo "./gradlew run"
}

whichhost () {
    echo "Current host is: ${TARGET_HOST}"
}

targetlocal () {
    TARGET_HOST='http://localhost:5050'
}

targetelb () {
    TARGET_HOST=$1
}
demohelp () {
    echo "Commands: traffic, bakepie, stoppie, bomb, healthcheck, start, whichhost, targetlocal, targetelb"
}
