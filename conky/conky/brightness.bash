#!/bin/bash

IFS=$'.' arr=$(xbacklight)
ar=($arr)
st=${ar[0]}
echo  $st
