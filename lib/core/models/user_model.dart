class UserModel {
  final String names;
  final String surnames;
  final String birthdate;
  final List<String> addresses;

  UserModel({
    required this.names,
    required this.surnames,
    required this.birthdate,
    required this.addresses,
  });

  factory UserModel.fromJsonNoData() => UserModel(
        names: '',
        surnames: '',
        birthdate: '',
        addresses: [],
      );
}

class ListUserModel {
  List<UserModel> listUserModel;

  ListUserModel({required this.listUserModel});

  factory ListUserModel.fromJsonNoData() => ListUserModel(
        listUserModel: [],
      );
}

class UserModelData {
  final UserModel userModel;

  UserModelData({required this.userModel});

  factory UserModelData.fromJsonNoData() => UserModelData(
        userModel: UserModel.fromJsonNoData(),
      );
}
