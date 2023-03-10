import 'package:dartz/dartz.dart';

import 'package:flutter_test_project/core/errors/failure.dart';
import 'package:flutter_test_project/core/models/user_model.dart';
import 'package:flutter_test_project/core/usecases/use_cases.dart';
import 'package:flutter_test_project/features/home/domain/repositories/home_repository.dart';

class GetUsersUseCase extends UseCase<List<UserModel>, NoParams> {
  final HomeRepository homeRepository;

  GetUsersUseCase({required this.homeRepository});

  @override
  Future<Either<Failure, List<UserModel>>> call(NoParams params) =>
      homeRepository.getUsers();
}
