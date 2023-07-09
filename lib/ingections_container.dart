import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:test/language_bloc/language_bloc.dart';
import 'Data/Network/check_connection_network.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  // ! Presentation

  // * Bloc
  sl.registerFactory(() {
    log('Register LanguageBloc');
    return LanguageBloc();
  });

  // * Usecases

  // * Repository

  // * Data Sources

  // ! Core
  sl.registerLazySingleton<CheckConnectionNetwork>(() {
    log('Register ChackConnectionNetwork');
    return CheckConnectionNetworkImplement(checker: sl());
  });

  // ! External
  sl.registerLazySingleton(() {
    log('Register InternetConnectionChecker');
    return InternetConnectionChecker();
  });
}
