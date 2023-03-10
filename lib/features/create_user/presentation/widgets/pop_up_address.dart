import 'package:flutter/material.dart';

import 'package:flutter_test_project/core/widgets/pop_up.dart';
import 'package:flutter_test_project/core/utils/app_functions.dart';
import 'package:flutter_test_project/core/widgets/text_field_custom.dart';
import 'package:flutter_test_project/features/create_user/presentation/bloc/create_user_cubit.dart';

popUpAddress({
  required BuildContext context,
  required CreateUserCubit bloc,
  required CreateUserState state,
}) {
  return popUp(
    context: context,
    title: 'Ingrese una dirección',
    okButton: OkButton(okButton: () => bloc.addAddress(context)),
    content: Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Form(
        key: state.formKeyAddress,
        child: TextFieldCustom(
          textInside: true,
          textOutside: false,
          type: TextFieldType.text,
          controller: state.addressController,
          onChanged: (String value) => bloc.enableButton(),
          validator: (String? value, TextFieldType type) =>
              AppFunctions.textFieldValidator(type: type, text: value),
        ),
      ),
    ),
  );
}
