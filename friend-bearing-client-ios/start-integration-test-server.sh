#!/bin/bash
set -e

cd integration-test-utils/stubbed-webserver
lein ring server-headless
