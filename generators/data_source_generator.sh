#!/bin/bash

source paths.sh
source str_manipulator.sh

function generate_data_source()
{
    generate_data_source_contract $1
    generate_data_source_impl $1
}


function generate_data_source_contract()
{
    upper_case_feature_name=$(get_upper_case_feature_name $1)

    echo "abstract class ${upper_case_feature_name}DataContract {

}">"${DATA_SOURCE_REMOTE_CONTRACT_DIR}/${1}_data_contract.dart"
}

function generate_data_source_impl()
{
    upper_case_feature_name=$(get_upper_case_feature_name $1)

    echo "import '../../contract/${1}_data_contract.dart';
import 'package:http/http.dart' as http;
    
class ${upper_case_feature_name}HttpImpl implements ${upper_case_feature_name}DataContract {


}">"${DATA_SOURCE_REMOTE_IMPL_HTTP_DIR}/${1}_http_impl.dart"
}