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

import '../../features/authentication/forget_password/api/forget_password_client.dart'
    as _i627;
import '../../features/authentication/forget_password/data/data_source/forget_password_data_source/forget_password_data_source_contract.dart'
    as _i667;
import '../../features/authentication/forget_password/data/data_source/forget_password_data_source/forget_password_data_source_impl.dart'
    as _i76;
import '../../features/authentication/forget_password/data/repository/forget_password_repo/forget_password_repo_impl.dart'
    as _i759;
import '../../features/authentication/forget_password/domain/repository/forget_password_repo/forget_password_repo_contract.dart'
    as _i387;
import '../../features/authentication/forget_password/domain/use_case/forget_password_use_case.dart'
    as _i819;
import '../../features/authentication/forget_password/presentation/view_model/forget_password_view_model_cubit.dart'
    as _i200;
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
    gh.factory<_i627.ForgetPasswordClient>(
      () => _i627.ForgetPasswordClient(gh<_i361.Dio>()),
    );
    gh.factory<_i667.ForgetPasswordDataSourceContract>(
      () => _i76.ForgetPasswordDataSourceImpl(
        client: gh<_i627.ForgetPasswordClient>(),
      ),
    );
    gh.factory<_i387.ForgetPasswordRepoContract>(
      () => _i759.ForgetPasswordRepoImpl(
        gh<_i667.ForgetPasswordDataSourceContract>(),
      ),
    );
    gh.factory<_i819.ForgetPasswordUseCase>(
      () => _i819.ForgetPasswordUseCase(gh<_i387.ForgetPasswordRepoContract>()),
    );
    gh.factory<_i200.ForgetPasswordViewModel>(
      () => _i200.ForgetPasswordViewModel(gh<_i819.ForgetPasswordUseCase>()),
    );
    return this;
  }
}

class _$DioModule extends _i977.DioModule {}
