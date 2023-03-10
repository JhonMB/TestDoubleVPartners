import 'package:dartz/dartz.dart';

import 'package:flutter_test_project/core/errors/failure.dart';
import 'package:flutter_test_project/core/errors/exceptions.dart';
import 'package:flutter_test_project/core/models/user_model.dart';
import 'package:flutter_test_project/features/create_user/data/data_sources/create_user_data_sources.dart';
import 'package:flutter_test_project/features/create_user/domain/repositories/create_user_repository.dart';

class CreateUserRepositoryImpl implements CreateUserRepository {
  final CreateUserDataSource createUserDataSource;

  CreateUserRepositoryImpl({required this.createUserDataSource});

  @override
  Future<Either<Failure, bool>> createUser(UserModel user) async {
    try {
      final result = await createUserDataSource.createUser(user);
      return Right(result);
    } on CreateUserException catch (e) {
      return Left(CreateUserFailure(message: e.message));
    }
  }
}
