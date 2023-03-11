import 'package:dartz/dartz.dart';

import 'package:flutter_test_project/core/errors/failure.dart';
import 'package:flutter_test_project/core/errors/exceptions.dart';
import 'package:flutter_test_project/core/models/user_model.dart';
import 'package:flutter_test_project/features/home/data/data_sources/home_data_sources.dart';
import 'package:flutter_test_project/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource homeDataSource;

  HomeRepositoryImpl({required this.homeDataSource});

  @override
  Future<Either<Failure, List<UserModel>>> getUsers() async {
    try {
      final result = await homeDataSource.getUsers();
      return Right(result);
    } on GetUsersException catch (e) {
      return Left(GetUsersFailure(message: e.message));
    }
  }
}
