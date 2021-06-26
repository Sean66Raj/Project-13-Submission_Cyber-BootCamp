#!/bin/bash
#checks for the existence of the ~/research directory


if [ -d ~/research ] 
then 
     echo "Directory exists"
else
     mkdir ~/research 
fi