#!/bin/bash

source paths.sh
source str_manipulator.sh

function configure_injection_container()
{
    append_injections_to_container $1
    append_imports_for_injection_container $1
}

function append_injections_to_container()
{
    upper_case_feature_name=$(get_upper_case_feature_name $1)
    
    sed -i "/init() async {/ s/$/\n  \/\/ ${upper_case_feature_name}\n  sl.registerLazySingleton(() => ${upper_case_feature_name}ControllerImpl(sl()));\n  sl.registerLazySingleton<${upper_case_feature_name}RepositoryContract>(() => ${upper_case_feature_name}RepositoryImpl(sl()));\n  sl.registerLazySingleton<${upper_case_feature_name}DataContract>(() => ${upper_case_feature_name}HttpImpl());\n/" $IOC_DIR
}

function append_imports_for_injection_container()
{
    sed -i "1s/$/\n\nimport 'repositories\/implementations\/${1}_repository_impl.dart';\nimport 'repositories\/contracts\/${1}_repository_contract.dart';\nimport 'controllers\/implementations\/${1}_controller_impl.dart';\nimport 'data_source\/remote\/contracts\/${1}_data_contract.dart';\nimport 'data_source\/remote\/implementations\/http\/${1}_http_impl.dart';/" $IOC_DIR
}