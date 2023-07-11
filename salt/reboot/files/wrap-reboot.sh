#!/bin/bash

nohup "$(dirname "$0")"/wait-and-reboot.sh &
disown
