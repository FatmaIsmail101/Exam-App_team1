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

import '../../features/home/api/data_sources/home_local_data_source_impl.dart'
    as _i831;
import '../../features/home/api/data_sources/home_remote_data_source_impl.dart'
    as _i1033;
import '../../features/home/api/home_api_client/home_api_client.dart' as _i866;
import '../../features/home/data/data_sources/home_local_data_source_contract.dart'
    as _i594;
import '../../features/home/data/data_sources/home_remote_data_source_contract.dart'
    as _i582;
import '../../features/home/data/repo/home_repo_impl.dart' as _i1024;
import '../../features/home/domain/repo/home_repo_contract.dart' as _i396;
import '../../features/home/domain/use_cases/get_categories_use_case.dart'
    as _i495;
import '../../features/home/domain/use_cases/get_products_use_case.dart'
    as _i674;
import '../../features/home/presentation/view_model/cubit/home_view_model.dart'
    as _i492;
import '../dio/dio_module.dart' as _i977;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.factory<_i495.GetCategoriesUseCase>(() => _i495.GetCategoriesUseCase());
    gh.singleton<_i361.Dio>(() => dioModule.dio);
    gh.factory<_i594.HomeLocalDataSourceContract>(
      () => _i831.HomeLocalDataSourceImpl(),
    );
    gh.factory<_i866.HomeApiClient>(() => _i866.HomeApiClient(gh<_i361.Dio>()));
    gh.factory<_i582.HomeRemoteDataSourceContract>(
      () => _i1033.HomeRemoteDataSourceImpl(gh<_i866.HomeApiClient>()),
    );
    gh.factory<_i396.HomeRepoContract>(
      () => _i1024.HomeRepoImpl(
        gh<_i582.HomeRemoteDataSourceContract>(),
        gh<_i594.HomeLocalDataSourceContract>(),
      ),
    );
    gh.factory<_i674.GetProductsUseCase>(
      () => _i674.GetProductsUseCase(gh<_i396.HomeRepoContract>()),
    );
    gh.factory<_i492.HomeViewModel>(
      () => _i492.HomeViewModel(
        gh<_i674.GetProductsUseCase>(),
        gh<_i495.GetCategoriesUseCase>(),
      ),
    );
    return this;
  }
}

class _$DioModule extends _i977.DioModule {}
