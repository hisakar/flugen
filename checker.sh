#!/bin/bash


function check_feature_name(){
    feature_name=$1
    if ((${#feature_name}==0))
    then
        printf "\033[0;31mERROR: You have to pass at least 1 parameter."
        exit 1
    fi
    
}