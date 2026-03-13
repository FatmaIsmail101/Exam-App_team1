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
import '../../features/authentication/forget_password/data/data_source/reset_password/reset_password_data_source_contract.dart'
    as _i227;
import '../../features/authentication/forget_password/data/data_source/reset_password/reset_password_data_source_impl.dart'
    as _i660;
import '../../features/authentication/forget_password/data/data_source/verify_email_data_source/verify_email_data_source_contract.dart'
    as _i808;
import '../../features/authentication/forget_password/data/data_source/verify_email_data_source/verify_email_data_source_impl.dart'
    as _i649;
import '../../features/authentication/forget_password/data/repository/forget_password_repo/forget_password_repo_impl.dart'
    as _i759;
import '../../features/authentication/forget_password/data/repository/reset_password_repo/reset_password_repo_impl.dart'
    as _i670;
import '../../features/authentication/forget_password/data/repository/verify_email_repo/verify_email_repo_impl.dart'
    as _i753;
import '../../features/authentication/forget_password/domain/repository/forget_password_repo/forget_password_repo_contract.dart'
    as _i387;
import '../../features/authentication/forget_password/domain/repository/reset_password_repo/reset_password_repo_contract.dart'
    as _i853;
import '../../features/authentication/forget_password/domain/repository/verify_email_repo/verify_email_repo_contract.dart'
    as _i62;
import '../../features/authentication/forget_password/domain/use_case/forget_password_use_case.dart'
    as _i819;
import '../../features/authentication/forget_password/domain/use_case/reset_password_use_case.dart'
    as _i973;
import '../../features/authentication/forget_password/domain/use_case/verify_email_use_case.dart'
    as _i402;
import '../../features/authentication/forget_password/presentation/view_model/forget_password_view_model_cubit.dart'
    as _i200;
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
    gh.factory<_i627.ForgetPasswordClient>(
      () => _i627.ForgetPasswordClient(gh<_i361.Dio>()),
    );
    gh.factory<_i405.LoginApi>(() => _i405.LoginApi(gh<_i361.Dio>()));
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
    gh.factory<_i658.LoginRemoteDataSource>(
      () => _i658.LoginRemoteDataSourceImpl(gh<_i405.LoginApi>()),
    );
    gh.factory<_i1056.LoginRepository>(
      () => _i217.AuthRepositoryImpl(gh<_i658.LoginRemoteDataSource>()),
    );
    gh.factory<_i532.LoginUseCase>(
      () => _i532.LoginUseCase(gh<_i1056.LoginRepository>()),
    );
    gh.factory<_i227.ResetPasswordDataSourceContract>(
      () => _i660.ResetPasswordDataSourceImpl(gh<_i627.ForgetPasswordClient>()),
    );
    gh.factory<_i808.VerifyEmailDataSourceContract>(
      () => _i649.VerifyEmailDataSourceImpl(gh<_i627.ForgetPasswordClient>()),
    );
    gh.factory<_i853.ResetPasswordRepoContract>(
      () => _i670.ResetPasswordRepoImpl(
        gh<_i227.ResetPasswordDataSourceContract>(),
      ),
    );
    gh.factory<_i62.VerifyEmailRepoContract>(
      () =>
          _i753.VerifyEmailRepoImpl(gh<_i808.VerifyEmailDataSourceContract>()),
    );
    gh.factory<_i819.ForgetPasswordUseCase>(
      () => _i819.ForgetPasswordUseCase(gh<_i387.ForgetPasswordRepoContract>()),
    );
    gh.factory<_i844.LoginCubit>(
      () => _i844.LoginCubit(gh<_i1056.LoginRepository>()),
    );
    gh.factory<_i973.ResetPasswordUseCase>(
      () => _i973.ResetPasswordUseCase(gh<_i853.ResetPasswordRepoContract>()),
    );
    gh.factory<_i402.VerifyEmailUseCase>(
      () => _i402.VerifyEmailUseCase(gh<_i62.VerifyEmailRepoContract>()),
    );
    gh.factory<_i200.ForgetPasswordViewModel>(
      () => _i200.ForgetPasswordViewModel(
        gh<_i819.ForgetPasswordUseCase>(),
        gh<_i402.VerifyEmailUseCase>(),
        gh<_i973.ResetPasswordUseCase>(),
      ),
    );
    return this;
  }
}

class _$DioModule extends _i977.DioModule {}
