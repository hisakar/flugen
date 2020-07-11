#!/bin/bash
# Flutter code generator

source checker.sh
source generators/view_generator.sh
source generators/controller_generator.sh
source generators/repository_generator.sh
source generators/data_source_generator.sh
source generators/injection_container_generator.sh
source generators/base_generator.sh
source file_manipulators/main_file_manipulator.sh
source file_manipulators/injection_container_manipulator.sh

function generate_dirs(){
    for dir in "${DIR_ARR[@]}"
    do
        [[ -d $dir ]] || mkdir $dir
    done
}

if [ "$1" = "start" ]
then
    
    generate_dirs
    init_main
    generate_injection_container
    generate_base_files
    
else
    
    check_feature_name $1
    generate_dirs
    generate_view $1
    generate_controller $1
    generate_repository $1
    generate_data_source $1
    configure_main $1
    configure_injection_container $1
    
fi
