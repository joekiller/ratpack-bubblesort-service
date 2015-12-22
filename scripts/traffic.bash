#!/usr/bin/env bash

traffic () {
    while true; do
        n1=$[ ( $RANDOM % 10 )  + 1 ]
        n2=$[ ( $RANDOM % 10 )  + 1 ]
        n3=$[ ( $RANDOM % 10 )  + 1 ]
        n4=$[ ( $RANDOM % 10 )  + 1 ]
        echo -n "[${n1},${n2},${n3},${n4}] -> "
        echo $(curl -s -X POST -H "Content-Type: application/json" -H "Cache-Control: no-cache" -d "[${n1},${n2},${n3},${n4}]" 'http://localhost:5050/sort')
        sleep $[ ( $RANDOM % 10 )  + 1 ]s
    done
}

bakepie () {
    echo $(curl -s -X GET -H "Content-Type: application/json" -H "Cache-Control: no-cache" 'http://localhost:5050/bakepie')
}

stoppie () {
    echo $(curl -s -X GET -H "Content-Type: application/json" -H "Cache-Control: no-cache" 'http://localhost:5050/stoppie')
}

bomb () {
    echo $(curl -s -X GET -H "Content-Type: application/json" -H "Cache-Control: no-cache" 'http://localhost:5050/armbomb')
    healthcheck
}

healthcheck () {
    echo $(curl -s -X GET -H "Content-Type: application/json" -H "Cache-Control: no-cache" 'http://localhost:5050/')
}
start () {
    echo "Run the following you silly goose."
    echo "./gradlew run"
}

demohelp () {
    echo "Commands: traffic, bakepie, stoppie, bomb, healthcheck, start"
}

demohelp