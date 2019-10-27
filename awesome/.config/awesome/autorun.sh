#!/usr/bin/env bash

function run {
       if ! pgrep $1 ;
       then
               $@&
       fi
}

run light-locker --lock-on-suspend
run udiskie --no-automount --tray
run nm-applet
