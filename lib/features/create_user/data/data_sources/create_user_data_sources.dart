import 'package:flutter_test_project/core/errors/exceptions.dart';
import 'package:flutter_test_project/core/models/user_model.dart';

abstract class CreateUserDataSource {
  Future<bool> createUser(UserModel user);
}

class CreateUserDataSourceImpl implements CreateUserDataSource {
  final ListUserModel listUserModelUseCase;

  CreateUserDataSourceImpl({required this.listUserModelUseCase});

  @override
  Future<bool> createUser(UserModel user) async {
    try {
      var listUser = listUserModelUseCase;
      listUser.listUserModel.add(user);

      return true;
    } on CreateUserException catch (e) {
      throw CreateUserException(message: e.message);
    }
  }
}
