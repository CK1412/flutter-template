// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_web_template/app/bloc/auth/auth_bloc.dart' as _i9;
import 'package:flutter_web_template/app/navigation/app_router.dart' as _i3;
import 'package:flutter_web_template/data/data_sources/remote_data_source.dart'
    as _i6;
import 'package:flutter_web_template/data/mappers/auth_mapper.dart' as _i4;
import 'package:flutter_web_template/data/repositories/auth_repository_impl.dart'
    as _i8;
import 'package:flutter_web_template/domain/repositories/auth_repository.dart'
    as _i7;
import 'package:flutter_web_template/presentation/pages/home/bloc/home_bloc.dart'
    as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.AppRouter>(() => _i3.AppRouter());
    gh.lazySingleton<_i4.AuthMapper>(() => _i4.AuthMapper());
    gh.factory<_i5.HomeBloc>(() => _i5.HomeBloc());
    gh.lazySingleton<_i6.RemoteDataSource>(() => _i6.RemoteDataSource());
    gh.lazySingleton<_i7.AuthRepository>(() => _i8.AuthRepositoryImpl(
          gh<_i6.RemoteDataSource>(),
          gh<_i4.AuthMapper>(),
        ));
    gh.lazySingleton<_i9.AuthBloc>(
        () => _i9.AuthBloc(gh<_i7.AuthRepository>()));
    return this;
  }
}
