#!/bin/bash

source paths.sh
source str_manipulator.sh

function generate_repository()
{
    generate_repository_contract $1
    generate_repository_impl $1
}


function generate_repository_contract()
{
    upper_case_feature_name=$(get_upper_case_feature_name $1)

    echo "abstract class ${upper_case_feature_name}RepositoryContract {

}">"${REPOSITORIES_CONTRACT_DIR}/${1}_repository_contract.dart"
}

function generate_repository_impl()
{
    upper_case_feature_name=$(get_upper_case_feature_name $1)

    echo "import '../contracts/${1}_repository_contract.dart';
import '../../data_source/remote/contracts/${1}_data_contract.dart';
    
class ${upper_case_feature_name}RepositoryImpl implements ${upper_case_feature_name}RepositoryContract {
  final ${upper_case_feature_name}DataContract dataContract;

  ${upper_case_feature_name}RepositoryImpl(this.dataContract);

}">"${REPOSITORIES_IMPL_DIR}/${1}_repository_impl.dart"
}