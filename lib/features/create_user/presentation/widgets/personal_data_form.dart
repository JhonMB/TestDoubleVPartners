import 'package:flutter/material.dart';

import 'package:flutter_test_project/core/utils/app_colors.dart';
import 'package:flutter_test_project/core/utils/app_functions.dart';
import 'package:flutter_test_project/core/widgets/text_field_custom.dart';
import 'package:flutter_test_project/features/create_user/presentation/bloc/create_user_cubit.dart';

class PersonalDataForm extends StatelessWidget {
  final CreateUserCubit bloc;
  final CreateUserState state;

  const PersonalDataForm({
    Key? key,
    required this.bloc,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formKey,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Información personal',
                  style: TextStyle(
                    fontSize: 16.0,
                    letterSpacing: .6,
                    color: AppColors.title,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFieldCustom(
                  fieldName: 'Nombres',
                  type: TextFieldType.name,
                  controller: state.namesController,
                  onChanged: (String value) => bloc.enableButton(),
                  validator: (String? value, TextFieldType type) =>
                      AppFunctions.textFieldValidator(
                    type: type,
                    text: value,
                  ),
                ),
                const SizedBox(height: 10.0),
                TextFieldCustom(
                  fieldName: 'Apellidos',
                  type: TextFieldType.lastName,
                  controller: state.surnamesController,
                  onChanged: (String value) => bloc.enableButton(),
                  validator: (String? value, TextFieldType type) =>
                      AppFunctions.textFieldValidator(
                    type: type,
                    text: value,
                  ),
                ),
                const SizedBox(height: 10.0),
                InkWell(
                  onTap: () => bloc.selectBirthdayDate(context),
                  child: TextFieldCustom(
                    enabled: false,
                    type: TextFieldType.text,
                    fieldName: 'Fecha de nacimiento',
                    controller: state.birthdateController,
                    validator: (String? value, TextFieldType type) =>
                        AppFunctions.textFieldValidator(
                      type: type,
                      text: value,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
