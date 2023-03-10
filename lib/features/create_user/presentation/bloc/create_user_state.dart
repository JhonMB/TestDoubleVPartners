part of 'create_user_cubit.dart';

class CreateUserState {
  final bool onWillPop;
  final UserModel user;
  final bool isEnableButton;
  final List<String> newAddresses;
  final TypeOfAction typeOfAction;
  final GlobalKey<FormState> formKey;
  final GlobalKey<FormState> formKeyAddress;
  final TextEditingController namesController;
  final TextEditingController addressController;
  final TextEditingController surnamesController;
  final TextEditingController birthdateController;

  CreateUserState({
    required this.user,
    required this.formKey,
    required this.onWillPop,
    required this.newAddresses,
    required this.typeOfAction,
    required this.formKeyAddress,
    required this.isEnableButton,
    required this.namesController,
    required this.addressController,
    required this.surnamesController,
    required this.birthdateController,
  });

  factory CreateUserState.initial() => CreateUserState(
        newAddresses: [],
        onWillPop: false,
        isEnableButton: false,
        formKey: GlobalKey<FormState>(),
        user: UserModel.fromJsonNoData(),
        typeOfAction: TypeOfAction.createUser,
        formKeyAddress: GlobalKey<FormState>(),
        namesController: TextEditingController(),
        addressController: TextEditingController(),
        surnamesController: TextEditingController(),
        birthdateController: TextEditingController(),
      );

  CreateUserState copyWith({
    bool? onWillPop,
    UserModel? user,
    bool? isEnableButton,
    List<String>? newAddresses,
    TypeOfAction? typeOfAction,
    TextEditingController? namesController,
    TextEditingController? addressController,
    TextEditingController? surnamesController,
    TextEditingController? birthdateController,
  }) {
    return CreateUserState(
      formKey: formKey,
      user: user ?? this.user,
      formKeyAddress: formKeyAddress,
      onWillPop: onWillPop ?? this.onWillPop,
      newAddresses: newAddresses ?? this.newAddresses,
      typeOfAction: typeOfAction ?? this.typeOfAction,
      isEnableButton: isEnableButton ?? this.isEnableButton,
      namesController: namesController ?? this.namesController,
      addressController: addressController ?? this.addressController,
      surnamesController: surnamesController ?? this.surnamesController,
      birthdateController: birthdateController ?? this.birthdateController,
    );
  }
}
