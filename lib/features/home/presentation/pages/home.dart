import 'package:flutter/material.dart';

import 'package:flutter_test_project/injection_container.dart';
import 'package:flutter_test_project/core/widgets/top_bar.dart';
import 'package:flutter_test_project/core/helpers/status_page.dart';
import 'package:flutter_test_project/features/home/presentation/bloc/home_cubit.dart';
import 'package:flutter_test_project/features/home/presentation/widgets/user_item.dart';

class Home extends StatusPage<HomeState, HomeCubit> {
  const Home({Key? key}) : super(key: key);

  @override
  HomeCubit createBloc(BuildContext context) => sl<HomeCubit>()..load();

  @override
  Widget buildPage(BuildContext context, HomeState state, HomeCubit bloc) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: topBar('Usuarios'),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              ...List.generate(
                state.listUser.length,
                (index) => UserItem(
                  birthdate: state.listUser[index].birthdate,
                  onEdit: () => bloc.editUser(state.listUser[index]),
                  onTap: () => bloc.viewInfoUser(
                      context: context, user: state.listUser[index]),
                  onDelete: () =>
                      bloc.deleteUser(index: index, context: context),
                  name:
                      '${state.listUser[index].names} ${state.listUser[index].names}',
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => bloc.createUser(),
          child: const Icon(Icons.add, size: 28.0),
        ),
      ),
    );
  }
}
