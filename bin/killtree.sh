#!/bin/bash

killtree() {
    local _pid=$1
    local _sig=${2:-TERM}
    kill -stop ${_pid} # needed to stop quickly forking parent from producing child between child killing and parent killing
    for _child in $(ps -o pid --no-headers --ppid ${_pid}); do
        killtree ${_child} ${_sig}
    done
    echo "killing -${_sig} ${_pid}"
    kill -${_sig} ${_pid}
}

#if [ $# -eq 1 -o $# -gt 1 ]; then
#    echo "Usage: $(basename $0) <pid> [signal]"
#    exit 1
#fi

PSID=`ps | grep ruby | sed -e "s/\([0-9]\) .*/\1/g" | head -n1`
echo Killng $PSID

#killtree $@ 
killtree $PSID $@
