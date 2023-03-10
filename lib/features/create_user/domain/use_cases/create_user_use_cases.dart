import 'package:dartz/dartz.dart';

import 'package:flutter_test_project/core/errors/failure.dart';
import 'package:flutter_test_project/core/models/user_model.dart';
import 'package:flutter_test_project/core/usecases/use_cases.dart';
import 'package:flutter_test_project/features/create_user/domain/repositories/create_user_repository.dart';

class CreateUserUseCase extends UseCase<bool, UserModel> {
  final CreateUserRepository createUserRepository;

  CreateUserUseCase({required this.createUserRepository});

  @override
  Future<Either<Failure, bool>> call(UserModel params) =>
      createUserRepository.createUser(params);
}
