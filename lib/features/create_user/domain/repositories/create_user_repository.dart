import 'package:dartz/dartz.dart';

import 'package:flutter_test_project/core/errors/failure.dart';
import 'package:flutter_test_project/core/models/user_model.dart';

abstract class CreateUserRepository {
  Future<Either<Failure, bool>> createUser(UserModel user);
}
