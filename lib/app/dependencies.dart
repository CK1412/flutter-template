import 'package:flutter_web_template/app/bloc/app_bloc.dart';
import 'package:flutter_web_template/app/navigation/app_router.dart';
import 'package:flutter_web_template/presentation/pages/home/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  _configureCores();
  _configureRepositories();
  _configureBlocs();
}

void _configureCores() {
  getIt.registerLazySingleton(AppRouter.new);
}

void _configureRepositories() {}

void _configureBlocs() {
  getIt
    ..registerFactory(AppBloc.new)
    ..registerFactory(HomeBloc.new);
}
