import 'package:flutter_web_template/app/bloc/auth/auth_bloc.dart';
import 'package:flutter_web_template/app/navigation/app_router.dart';
import 'package:flutter_web_template/data/data_sources/remote_data_source.dart';
import 'package:flutter_web_template/data/mappers/auth_mapper.dart';
import 'package:flutter_web_template/data/repositories/auth_repository_impl.dart';
import 'package:flutter_web_template/domain/repositories/auth_repository.dart';
import 'package:flutter_web_template/presentation/pages/home/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  _configureCores();
  _configureMappers();
  _configureRepositories();
  _configureBlocs();
}

void _configureCores() {
  getIt
    ..registerLazySingleton(AppRouter.new)
    ..registerLazySingleton(RemoteDataSource.new);
}

void _configureMappers() {
  getIt.registerLazySingleton(AuthMapper.new);
}

void _configureRepositories() {
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(getIt(), getIt()),
  );
}

void _configureBlocs() {
  getIt
    ..registerLazySingleton(() => AuthBloc(getIt()))
    ..registerFactory(HomeBloc.new);
}
