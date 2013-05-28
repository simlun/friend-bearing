#!/bin/bash -ex

# VARIABLES
###########

STOCKHOLM_LAT="59.33"
STOCKHOLM_LONG="18.07"
SAN_FRANCISCO_LAT="37.775"
SAN_FRANCISCO_LONG="-122.4183"

EXPECTED_BEARING="329"


# FUNCTIONS
###########

function start-system {
    (
        cd server
        ./start.sh
    )
}

function stop-system {
    (
        cd server
        ./stop.sh
    )
}

function new-session {
    curl -sS -X POST http://localhost:3000/session
}

function update-position {
    echo TODO
}

function find-friend {
    echo TODO
}


# TEST
######

start-system

SESSION1=$(new-session)
SESSION2=$(new-session)

update-position $SESSION1 $STOCKHOLM_LAT $STOCKHOLM_LONG
update-position $SESSION2 $SAN_FRANCISCO_LAT $SAN_FRANCISCO_LONG

BEARING=$(find-friend $SESSION1 2)

stop-system

if [ $BEARING == $EXPECTED_BEARING ]; then
    echo "Test succeeded"
else
    echo "Test failed"
    exit 1
fi

