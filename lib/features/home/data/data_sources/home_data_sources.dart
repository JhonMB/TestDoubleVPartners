import 'package:flutter_test_project/core/errors/exceptions.dart';
import 'package:flutter_test_project/core/models/user_model.dart';

abstract class HomeDataSource {
  Future<List<UserModel>> getUsers();
}

class HomeDataSourceImpl implements HomeDataSource {
  final ListUserModel listUserModelUseCase;

  HomeDataSourceImpl({required this.listUserModelUseCase});

  @override
  Future<List<UserModel>> getUsers() async {
    try {
      return listUserModelUseCase.listUserModel;
    } on CreateUserException catch (e) {
      throw CreateUserException(message: e.message);
    }
  }
}
