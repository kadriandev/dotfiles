#!/usr/bin/env bash

CURR_DIR=$(pwd)

cd ~/IdaptiveCLI8
python3 ~/IdaptiveCLI8/AWSCLI.py -c codecommit

export AWS_PROFILE=Sys_AWS_User_All_CodeCommit_profile

cd $CURR_DIR
