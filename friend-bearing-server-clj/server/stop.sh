#!/bin/bash -e

echo "Killing server"
kill $(cat server.pid)
rm server.pid

