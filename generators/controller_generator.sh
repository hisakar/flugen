#!/bin/bash

source paths.sh
source str_manipulator.sh

generate_controller(){
    generate_controller_contract $1
    generate_controller_impl $1
}

function generate_controller_contract()
{
    upper_case_feature_name=$(get_upper_case_feature_name $1)
    
    echo "abstract class ${upper_case_feature_name}ControllerContract {

}">"${CONTROLLER_CONTRACT_DIR}/${1}_controller_contract.dart"
}

function generate_controller_impl()
{
    upper_case_feature_name=$(get_upper_case_feature_name $1)
    
    echo "import '../contracts/${1}_controller_contract.dart';
import '../../base/controller.dart';
import '../../repositories/contracts/${1}_repository_contract.dart';

class ${upper_case_feature_name}ControllerImpl extends Controller
implements ${upper_case_feature_name}ControllerContract {
  final ${upper_case_feature_name}RepositoryContract repository;

  ${upper_case_feature_name}ControllerImpl(this.repository);

  @override
  void initListeners() {}

}">${CONTROLLER_IMPL_DIR}/${1}_controller_impl.dart
}