#!/bin/bash

 BASE_DIR="./lib/base"
 MAIN_DIR="./lib/main.dart"
 CONTROLLER_DIR="./lib/controllers"
 CONTROLLER_CONTRACT_DIR="./lib/controllers/contracts"
 CONTROLLER_IMPL_DIR="./lib/controllers/implementations"
 DATA_SOURCE_DIR="./lib/data_source"
 DATA_SOURCE_LOCAL_DIR="./lib/data_source/local"
 DATA_SOURCE_LOCAL_DB_DIR="./lib/data_source/db"
 DATA_SOURCE_LOCAL_DRIVER_DIR="./lib/data_source/driver"
 DATA_SOURCE_LOCAL_FILE_DIR="./lib/data_source/file"
 DATA_SOURCE_LOCAL_MEMORY_DIR="./lib/data_source/memory"
 DATA_SOURCE_REMOTE_DIR="./lib/data_source/remote"
 DATA_SOURCE_REMOTE_CONTRACT_DIR="./lib/data_source/remote/contracts"
 DATA_SOURCE_REMOTE_IMPL_DIR="./lib/data_source/remote/implementations"
 DATA_SOURCE_REMOTE_IMPL_HTTP_DIR="./lib/data_source/remote/implementations/http"
 MODELS_DIR="./lib/models"
 REPOSITORIES_DIR="./lib/repositories"
 REPOSITORIES_CONTRACT_DIR="./lib/repositories/contracts"
 REPOSITORIES_IMPL_DIR="./lib/repositories/implementations"
 UTILS_DIR="./lib/utils"
 VIEWS_DIR="./lib/views"
 VIEWS_COMMON_DIR="./lib/views/common"
 VIEWS_THEMES_DIR="./lib/views/themes"
 VIEWS_THEMES_COLOR_DIR="./lib/views/themes/color"
 VIEWS_THEMES_DECORATION_DIR="./lib/views/themes/decoration"
 VIEWS_THEMES_STYLE_DIR="./lib/views/themes/style"
 VIEWS_THEMES_THEME_DIR="./lib/views/themes/theme"

declare -a DIR_ARR=(
    $BASE_DIR
    $CONTROLLER_DIR
    $CONTROLLER_CONTRACT_DIR
    $CONTROLLER_IMPL_DIR
    $DATA_SOURCE_DIR
    $DATA_SOURCE_LOCAL_DIR
    $DATA_SOURCE_LOCAL_DB_DIR
    $DATA_SOURCE_LOCAL_DRIVER_DIR
    $DATA_SOURCE_LOCAL_FILE_DIR
    $DATA_SOURCE_LOCAL_MEMORY_DIR
    $DATA_SOURCE_REMOTE_DIR
    $DATA_SOURCE_REMOTE_CONTRACT_DIR
    $DATA_SOURCE_REMOTE_IMPL_DIR
    $DATA_SOURCE_REMOTE_IMPL_HTTP_DIR
    $MODELS_DIR
    $REPOSITORIES_DIR
    $REPOSITORIES_CONTRACT_DIR
    $REPOSITORIES_IMPL_DIR
    $UTILS_DIR
    $VIEWS_DIR
    $VIEWS_COMMON_DIR
    $VIEWS_THEMES_DIR
    $VIEWS_THEMES_COLOR_DIR
    $VIEWS_THEMES_DECORATION_DIR
    $VIEWS_THEMES_STYLE_DIR
    $VIEWS_THEMES_THEME_DIR
)