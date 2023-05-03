#!/usr/bin/env bash

stow --restow stow

for d in `ls -d */`;
do
    ( stow --restow $d )
done