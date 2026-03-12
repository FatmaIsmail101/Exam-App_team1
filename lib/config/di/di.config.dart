// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/authentication/login/data/api/login_api.dart' as _i405;
import '../../features/authentication/login/data/datasources/login_remote_datasource.dart'
    as _i658;
import '../../features/authentication/login/data/repositories/login_repository_impl.dart'
    as _i217;
import '../../features/authentication/login/domain/repositories/login_repository.dart'
    as _i1056;
import '../../features/authentication/login/domain/usecases/login_usecase.dart'
    as _i532;
import '../../features/authentication/login/presentation/cubit/cubit.dart'
    as _i844;
import '../dio/dio_module.dart' as _i977;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.singleton<_i361.Dio>(() => dioModule.dio);
    gh.factory<_i405.LoginApi>(() => _i405.LoginApi(gh<_i361.Dio>()));
    gh.factory<_i658.LoginRemoteDataSource>(
      () => _i658.LoginRemoteDataSourceImpl(gh<_i405.LoginApi>()),
    );
    gh.factory<_i1056.LoginRepository>(
      () => _i217.AuthRepositoryImpl(gh<_i658.LoginRemoteDataSource>()),
    );
    gh.factory<_i532.LoginUseCase>(
      () => _i532.LoginUseCase(gh<_i1056.LoginRepository>()),
    );
    gh.factory<_i844.LoginCubit>(
      () => _i844.LoginCubit(gh<_i1056.LoginRepository>()),
    );
    return this;
  }
}

class _$DioModule extends _i977.DioModule {}
