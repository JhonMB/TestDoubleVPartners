import 'package:get_it/get_it.dart';

import 'package:flutter_test_project/core/models/user_model.dart';
import 'package:flutter_test_project/features/home/presentation/bloc/home_cubit.dart';
import 'package:flutter_test_project/features/splash/presentation/bloc/splash_cubit.dart';
import 'package:flutter_test_project/features/home/data/data_sources/home_data_sources.dart';
import 'package:flutter_test_project/features/home/domain/repositories/home_repository.dart';
import 'package:flutter_test_project/features/home/domain/use_cases/get_users_use_cases.dart';
import 'package:flutter_test_project/features/home/data/repositories/home_repository_impl.dart';
import 'package:flutter_test_project/features/create_user/presentation/bloc/create_user_cubit.dart';
import 'package:flutter_test_project/features/create_user/domain/use_cases/create_user_use_cases.dart';
import 'package:flutter_test_project/features/create_user/data/data_sources/create_user_data_sources.dart';
import 'package:flutter_test_project/features/create_user/domain/repositories/create_user_repository.dart';
import 'package:flutter_test_project/features/create_user/data/repositories/create_user_repository_impl.dart';

final sl = GetIt.instance;

init() async {
  // ---------------------------------------------------------------------
  //                                 Blocs
  // ---------------------------------------------------------------------
  sl.registerFactory(() => SplashCubit());
  sl.registerFactory(() => HomeCubit(homeUseCase: sl()));
  sl.registerFactory(() => CreateUserCubit(createUserUseCase: sl()));

  // ---------------------------------------------------------------------
  //                               Use cases
  // ---------------------------------------------------------------------
  sl.registerLazySingleton(() => GetUsersUseCase(homeRepository: sl()));
  sl.registerLazySingleton(() => CreateUserUseCase(createUserRepository: sl()));

  // ---------------------------------------------------------------------
  //                              Repositories
  // ---------------------------------------------------------------------
  sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(homeDataSource: sl()));
  sl.registerLazySingleton<CreateUserRepository>(
      () => CreateUserRepositoryImpl(createUserDataSource: sl()));

  // ---------------------------------------------------------------------
  //                               DataSource
  // ---------------------------------------------------------------------
  sl.registerLazySingleton<HomeDataSource>(
      () => HomeDataSourceImpl(listUserModelUseCase: sl()));
  sl.registerLazySingleton<CreateUserDataSource>(
      () => CreateUserDataSourceImpl(listUserModelUseCase: sl()));

  // ---------------------------------------------------------------------
  //                                Data Models
  // ---------------------------------------------------------------------
  sl.registerLazySingleton<ListUserModel>(
      () => ListUserModel(listUserModel: []));
}
