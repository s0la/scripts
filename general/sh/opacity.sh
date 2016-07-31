#!/bin/bash

id=$(xwininfo -root -tree | grep "x71+" | grep -Eo '0x[0-9a-z]+')
transset -i $id 0.8