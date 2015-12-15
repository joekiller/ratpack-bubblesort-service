Bubblesort service

bubblesort service is an intentionally inefficient webservice for sorting integers to be used for the ops deployment test project.

To run from source:
    ./gradlew run

To generate a fat jar containing ratpack runtime
    ./gradlew shadowJar

To run the built jar
    java -jar build/libs/bubble-sort-service-all.jar

To build the jar or run the service an evniroment with Java 8 is required.

Once the service is started, the interfaces are:

    GET /
        returns "Sort Service is running" as a basic ping/status check
        curl -X GET -H "Content-Type: application/json" -H "Cache-Control: no-cache" 'http://localhost:5050/'
    POST /sort
        takes a json array of integers in the body, and returns that list as json, sorted ascending
        curl -X POST -H "Content-Type: application/json" -H "Cache-Control: no-cache" -d '[1,2,4,3]' 'http://localhost:5050/sort'
