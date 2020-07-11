#!/bin/bash

source paths.sh
source str_manipulator.sh

function configure_main()
{
    append_view_to_routes $1
    append_imports_for_main $1
}

function append_view_to_routes()
{
    upper_case_feature_name=$(get_upper_case_feature_name $1)
    
    sed -i "/routes: {/ s/$/\n        ${upper_case_feature_name}View.routeName: (_) => ${upper_case_feature_name}View(GetIt.I<${upper_case_feature_name}ControllerImpl>()),/" $MAIN_DIR
}

function append_imports_for_main()
{
    sed -i "1s/$/\nimport 'controllers\/implementations\/${1}_controller_impl.dart';\nimport 'views\/${1}_view.dart';/" $MAIN_DIR
}

function init_main()
{
    sed -i "1s/$/\nimport 'injection_container.dart' as di;/" $MAIN_DIR
    sed -i "s/void main()/void main() async/" $MAIN_DIR
    sed -i "/void main() async {/ s/$/\n  WidgetsFlutterBinding.ensureInitialized();/" $MAIN_DIR
    sed -i "/return MaterialApp(/ s/$/\n      routes: {\n      },/" $MAIN_DIR
    sed -i "/return MaterialApp(/ s/$/\n      initialRoute: '\/',/" $MAIN_DIR
    sed -i "/WidgetsFlutterBinding.ensureInitialized();/ s/$/\n  await di.init();/" $MAIN_DIR
}