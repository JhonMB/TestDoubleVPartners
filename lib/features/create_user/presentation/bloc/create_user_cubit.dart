import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter_test_project/navigator.dart';
import 'package:flutter_test_project/core/widgets/loading.dart';
import 'package:flutter_test_project/core/models/user_model.dart';
import 'package:flutter_test_project/core/utils/app_functions.dart';
import 'package:flutter_test_project/core/widgets/snack_bar_message_custom.dart';
import 'package:flutter_test_project/features/create_user/presentation/pages/create_user.dart';
import 'package:flutter_test_project/features/create_user/presentation/widgets/pop_up_address.dart';
import 'package:flutter_test_project/features/create_user/domain/use_cases/create_user_use_cases.dart';

part 'create_user_state.dart';

class CreateUserCubit extends Cubit<CreateUserState> {
  final CreateUserUseCase createUserUseCase;

  CreateUserCubit({
    required this.createUserUseCase,
  }) : super(CreateUserState.initial());

  Future<void> load(Map<String, dynamic> arguments) async {
    emit(CreateUserState.initial());
    validateTypeOfAction(arguments);
  }

  void validateTypeOfAction(Map<String, dynamic> arguments) {
    if (arguments['typeOfAction'] == TypeOfAction.editUser) {
      state.namesController.text = arguments['user'].names;
      state.surnamesController.text = arguments['user'].surnames;
      state.birthdateController.text = arguments['user'].birthdate;

      emit(
        state.copyWith(
          user: arguments['user'],
          typeOfAction: TypeOfAction.editUser,
          newAddresses: arguments['user'].addresses,
        ),
      );
      enableButton();
    }
  }

  Future<void> selectBirthdayDate(BuildContext context) async {
    final DateTime? date = await showDatePicker(
      context: context,
      lastDate: DateTime.now(),
      firstDate: DateTime(1900),
      locale: const Locale("es", "ES"),
      initialDate: state.birthdateController.text != ''
          ? AppFunctions.formatDate(state.birthdateController.text)
          : DateTime.now(),
    );

    if (date != null) {
      emit(
        state.copyWith(
          birthdateController: TextEditingController(
            text: DateFormat('dd/MM/yyyy').format(date).toString(),
          ),
        ),
      );
    }
    enableButton();
  }

  void enableButton() {
    if (state.namesController.text != '' &&
        state.surnamesController.text != '' &&
        state.birthdateController.text != '') {
      emit(state.copyWith(isEnableButton: true));
    } else {
      emit(state.copyWith(isEnableButton: false));
    }
  }

  void showPopupAddress({
    required BuildContext context,
    required CreateUserCubit bloc,
  }) =>
      popUpAddress(bloc: bloc, state: state, context: context);

  void addAddress(BuildContext context) {
    if (state.formKeyAddress.currentState!.validate()) {
      List<String> newAddresses = state.newAddresses;
      newAddresses.add(state.addressController.text);

      emit(state.copyWith(user: state.user, newAddresses: newAddresses));
      state.addressController.clear();
      AppNavigator.pop();
    }
  }

  void deleteAddresses({required int index, required BuildContext context}) {
    List<String> addresses = state.newAddresses;
    addresses.removeAt(index);

    emit(state.copyWith(newAddresses: addresses));

    snackBarMessageCustom(
      context: context,
      snackBarType: SnackBarType.success,
      message: 'Genial!... Se ha borrado correctamente la dirección.',
    );
  }

  void createUser(BuildContext context) async {
    _activeLoading(context);

    if (state.formKey.currentState!.validate()) {
      final resul = await createUserUseCase(
        UserModel(
          addresses: state.newAddresses,
          names: state.namesController.text,
          surnames: state.surnamesController.text,
          birthdate: state.birthdateController.text,
        ),
      );

      resul.fold(
        (dynamic failure) {
          _disableLoading(context);
          snackBarMessageCustom(
            context: context,
            message: 'Opps... Hubo un problema, inténtalo de nuevo',
          );
        },
        (bool value) => delayedForRequest(context),
      );
    } else {
      _disableLoading(context);
      snackBarMessageCustom(
        context: context,
        snackBarType: SnackBarType.warning,
        message: 'Ocurrio un problema!... Verifica los datos ingresados',
      );
    }
  }

  void delayedForRequest(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 1),
      () async {
        _disableLoading(context);
        snackBarMessageCustom(
          context: context,
          snackBarType: SnackBarType.success,
          message: 'Genial!... Se ha creado correctamente el nuevo usuario.',
        );
        goBack(value: true, context: context);
      },
    );
  }

  void goBack({required bool value, required BuildContext context}) =>
      AppNavigator.pop(params: {"value": value});

  _activeLoading(BuildContext context) =>
      loading(context: context, onWillPop: state.onWillPop);

  _disableLoading(BuildContext context) => Navigator.of(context).pop();
}
