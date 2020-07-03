#!/bin/bash
# Flutter code generator

source ./checker.sh
source ./generators/view_generator.sh
source ./generators/controller_generator.sh
source ./generators/repository_generator.sh
source ./generators/data_source_generator.sh

FEATURE_NAME=$1


function generate_dirs(){
    for dir in "${DIR_ARR[@]}"
    do
        [[ -d $dir ]] || mkdir $dir
    done
}


check_feature_name $1
generate_dirs
generate_view $1
generate_controller $1
generate_repository $1
generate_data_source $1