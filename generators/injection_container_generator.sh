#!/bin/bash

source paths.sh

function generate_injection_container()
{
    
    echo "import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {


  //Common
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}" >  $IOC_DIR
}