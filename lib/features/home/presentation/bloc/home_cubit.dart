import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_test_project/navigator.dart';
import 'package:flutter_test_project/core/models/user_model.dart';
import 'package:flutter_test_project/core/usecases/use_cases.dart';
import 'package:flutter_test_project/core/widgets/snack_bar_message_custom.dart';
import 'package:flutter_test_project/features/home/domain/use_cases/get_users_use_cases.dart';
import 'package:flutter_test_project/features/create_user/presentation/pages/create_user.dart';
import 'package:flutter_test_project/features/home/presentation/widgets/bottom_sheet_information.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetUsersUseCase homeUseCase;

  HomeCubit({
    required this.homeUseCase,
  }) : super(HomeState.initial());

  Future<void> load() async {
    emit(HomeState.initial());
    getUsers();
  }

  Future<void> getUsers() async {
    final resulFirebase = await homeUseCase(NoParams());

    resulFirebase.fold(
      (dynamic failure) {},
      (List<UserModel> listUser) => emit(state.copyWith(listUser: listUser)),
    );
  }

  void createUser() => AppNavigator.push(Routes.CREATEUSER)
      .then((value) => value['value'] ? getUsers() : null);

  void viewInfoUser({required BuildContext context, required UserModel user}) {
    bottomSheetInformation(user: user, context: context);
  }

  void deleteUser({required int index, required BuildContext context}) {
    final List<UserModel> users = state.listUser;
    users.removeAt(index);

    emit(state.copyWith(listUser: users));

    snackBarMessageCustom(
      context: context,
      snackBarType: SnackBarType.success,
      message: 'Genial!... Se ha borrado correctamente el susuario.',
    );
  }

  void editUser(UserModel user) => AppNavigator.push(
        Routes.CREATEUSER,
        arguments: {"user": user, "typeOfAction": TypeOfAction.editUser},
      ).then((value) => value['value'] ? getUsers() : null);
}
