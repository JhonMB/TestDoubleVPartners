import 'package:dartz/dartz.dart';

import 'package:flutter_test_project/core/errors/failure.dart';
import 'package:flutter_test_project/core/models/user_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<UserModel>>> getUsers();
}
