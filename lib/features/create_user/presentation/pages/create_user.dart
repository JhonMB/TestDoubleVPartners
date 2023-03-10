import 'package:flutter/material.dart';

import 'package:flutter_test_project/injection_container.dart';
import 'package:flutter_test_project/core/widgets/top_bar.dart';
import 'package:flutter_test_project/core/utils/app_colors.dart';
import 'package:flutter_test_project/core/helpers/status_page.dart';
import 'package:flutter_test_project/features/create_user/presentation/bloc/create_user_cubit.dart';
import 'package:flutter_test_project/features/create_user/presentation/widgets/address_content.dart';
import 'package:flutter_test_project/features/create_user/presentation/widgets/personal_data_form.dart';

enum TypeOfAction { editUser, createUser }

class CreateUser extends StatusPage<CreateUserState, CreateUserCubit> {
  final Map<String, dynamic> arguments;

  const CreateUser({Key? key, required this.arguments}) : super(key: key);

  @override
  CreateUserCubit createBloc(BuildContext context) =>
      sl<CreateUserCubit>()..load(arguments);

  @override
  Widget buildPage(
    BuildContext context,
    CreateUserState state,
    CreateUserCubit bloc,
  ) {
    return WillPopScope(
      onWillPop: () async {
        bloc.goBack(value: false, context: context);
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: topBar(
          state.typeOfAction == TypeOfAction.createUser
              ? 'Nuevo usuario'
              : 'Editar usuario',
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      PersonalDataForm(bloc: bloc, state: state),
                      const SizedBox(height: 10.0),
                      AddressContent(bloc: bloc, state: state),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 4.0),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: state.isEnableButton
                          ? () => bloc.createUser(context)
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryLight,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: Text(
                        state.typeOfAction == TypeOfAction.createUser
                            ? 'Crear usuario'
                            : 'Guardar cambios',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
