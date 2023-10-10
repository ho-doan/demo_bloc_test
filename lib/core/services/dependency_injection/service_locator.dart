import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../data_source/networks/i_api_client.dart';
import 'service_locator.config.dart';

final getIt = GetIt.instance;

// ignore: inference_failure_on_function_return_type
@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false,
)
// ignore: always_declare_return_types
configureDependencies({
  required Dio dio,
  String? url,
}) {
  getIt.registerLazySingleton<ApiClient>(() => ApiClient(dio, baseUrl: url));

  $initGetIt(getIt);
}

@visibleForTesting
configureDependenciesTest() {
  getIt.registerLazySingleton<ApiClient>(() => ApiClient(Dio()));

  $initGetIt(getIt);
}
