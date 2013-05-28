#!/bin/bash -e

java -cp $(lein classpath) clojure.main -m friend-bearing.server &
echo $! > server.pid

echo "Waiting for web server to start on port 3000"
until nc -zw2 localhost 3000 &> /dev/null
do
  printf '.'
  sleep 1
done

