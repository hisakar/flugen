#!/bin/bash

function get_upper_case_feature_name(){
    IFS='_'
    local feature_name
    for word in $1;
    do
        feature_name+="${word^}"
    done
    
    if ((${#feature_name} == ${#1}))
    then
        feature_name=""
        
        IFS='-'
        for word in $1;
        do
            feature_name+="${word^}"
        done
    fi
    
    echo "$feature_name"
}