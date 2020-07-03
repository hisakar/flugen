#!/bin/bash

source ./paths.sh
source ./str_manipulator.sh

function append_to_routes()
{
    upper_case_feature_name=$(get_upper_case_feature_name $1)
    
    sed -i "/routes: {/ s/$/\n        ${upper_case_feature_name}View.routeName: (_) => ${upper_case_feature_name}View(GetIt.I<${upper_case_feature_name}ControllerImpl>()),/" $MAIN_DIR
}