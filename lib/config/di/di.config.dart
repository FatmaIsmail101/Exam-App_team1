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
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/authentication/forget_password/api/forget_password_client.dart'
    as _i627;
import '../../features/authentication/forget_password/data/data_source/forget_password_data_source_contract.dart'
    as _i453;
import '../../features/authentication/forget_password/data/data_source/forget_password_data_source_impl.dart'
    as _i200;
import '../../features/authentication/forget_password/data/repository/forget_password_repo_impl.dart'
    as _i451;
import '../../features/authentication/forget_password/domain/repository/forget_password_repo_contract.dart'
    as _i702;
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
import '../../features/home/questions/api/question_client.dart' as _i892;
import '../../features/home/questions/data/data_source/question_data_source_impl.dart'
    as _i984;
import '../../features/home/questions/data/data_source/questions_data_source_contract.dart'
    as _i786;
import '../../features/home/questions/data/repository/question_repo_impl.dart'
    as _i770;
import '../../features/home/questions/domain/repository/question_repo_contract.dart'
    as _i858;
import '../../features/home/questions/domain/use_case/exam_result_use_case.dart'
    as _i1029;
import '../../features/home/questions/domain/use_case/question_usecase.dart'
    as _i1005;
import '../../features/home/subject/api/subject_api_client/subject_api_client.dart'
    as _i34;
import '../../features/home/subject/data/repo/subject_repo_impl.dart' as _i704;
import '../../features/home/subject/data/subject_data_source_impl/subject_data_source_impl.dart'
    as _i245;
import '../../features/home/subject/data/subject_data_source_impl/subject_remote_data_sourcr_contract.dart'
    as _i98;
import '../../features/home/subject/domain/subject_repo_contract/subject_repo_contract.dart'
    as _i932;
import '../../features/home/subject/domain/subject_usecase.dart' as _i1035;
import '../../features/home/subject/presentation/cubit/subject_view_model.dart'
    as _i442;
import '../caching/shared_pref_module.dart' as _i763;
import '../dio/dio_module.dart' as _i977;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final sharedPrefModule = _$SharedPrefModule();
    final dioModule = _$DioModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => sharedPrefModule.prefs,
      preResolve: true,
    );
    gh.singleton<_i361.Dio>(() => dioModule.dio);
    gh.factory<_i627.ForgetPasswordClient>(
      () => _i627.ForgetPasswordClient(gh<_i361.Dio>()),
    );
    gh.factory<_i405.LoginApi>(() => _i405.LoginApi(gh<_i361.Dio>()));
    gh.factory<_i892.QuestionClient>(
      () => _i892.QuestionClient(gh<_i361.Dio>()),
    );
    gh.factory<_i34.SubjectApiClient>(
      () => _i34.SubjectApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i786.QuestionsDataSourceContract>(
      () => _i984.QuestionDataSourceImpl(gh<_i892.QuestionClient>()),
    );
    gh.factory<_i453.ForgetPasswordDataSourceContract>(
      () => _i200.ForgetPasswordDataSourceImpl(
        client: gh<_i627.ForgetPasswordClient>(),
      ),
    );
    gh.factory<_i98.SubjectRemoteDataSourcrContract>(
      () => _i245.SubjectDataSourceImpl(gh<_i34.SubjectApiClient>()),
    );
    gh.factory<_i702.ForgetPasswordRepoContract>(
      () => _i451.ForgetPasswordRepoImpl(
        gh<_i453.ForgetPasswordDataSourceContract>(),
      ),
    );
    gh.factory<_i819.ForgetPasswordUseCase>(
      () => _i819.ForgetPasswordUseCase(gh<_i702.ForgetPasswordRepoContract>()),
    );
    gh.factory<_i973.ResetPasswordUseCase>(
      () => _i973.ResetPasswordUseCase(gh<_i702.ForgetPasswordRepoContract>()),
    );
    gh.factory<_i402.VerifyEmailUseCase>(
      () => _i402.VerifyEmailUseCase(gh<_i702.ForgetPasswordRepoContract>()),
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
    gh.factory<_i858.QuestionRepoContract>(
      () => _i770.QuestionRepoImpl(gh<_i786.QuestionsDataSourceContract>()),
    );
    gh.factory<_i1029.ExamResultUseCase>(
      () => _i1029.ExamResultUseCase(gh<_i858.QuestionRepoContract>()),
    );
    gh.factory<_i1005.QuestionUsecase>(
      () => _i1005.QuestionUsecase(gh<_i858.QuestionRepoContract>()),
    );
    gh.factory<_i932.SubjectRepoContract>(
      () => _i704.SubjectRepoImpl(gh<_i98.SubjectRemoteDataSourcrContract>()),
    );
    gh.factory<_i1035.SubjectUsecase>(
      () => _i1035.SubjectUsecase(gh<_i932.SubjectRepoContract>()),
    );
    gh.factory<_i200.ForgetPasswordViewModel>(
      () => _i200.ForgetPasswordViewModel(
        gh<_i819.ForgetPasswordUseCase>(),
        gh<_i402.VerifyEmailUseCase>(),
        gh<_i973.ResetPasswordUseCase>(),
      ),
    );
    gh.factory<_i844.LoginCubit>(
      () => _i844.LoginCubit(gh<_i1056.LoginRepository>()),
    );
    gh.factory<_i442.SubjectViewModel>(
      () => _i442.SubjectViewModel(gh<_i1035.SubjectUsecase>()),
    );
    return this;
  }
}

class _$SharedPrefModule extends _i763.SharedPrefModule {}

class _$DioModule extends _i977.DioModule {}
