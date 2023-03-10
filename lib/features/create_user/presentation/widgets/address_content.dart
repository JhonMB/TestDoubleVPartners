import 'package:flutter/material.dart';

import 'package:flutter_test_project/core/utils/app_colors.dart';
import 'package:flutter_test_project/core/widgets/address_item.dart';
import 'package:flutter_test_project/features/create_user/presentation/bloc/create_user_cubit.dart';

class AddressContent extends StatelessWidget {
  final CreateUserCubit bloc;
  final CreateUserState state;

  const AddressContent({
    Key? key,
    required this.bloc,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Direcciones',
                  style: TextStyle(
                    fontSize: 16.0,
                    letterSpacing: .6,
                    color: AppColors.title,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              InkWell(
                child: Text(
                  'Añadir +',
                  style: TextStyle(
                    letterSpacing: .6,
                    color: AppColors.success,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () => bloc.showPopupAddress(
                  bloc: bloc,
                  context: context,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          state.newAddresses.isEmpty
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Center(
                    child: Text(
                      'No tienes direcciones añadidas.',
                      style: TextStyle(
                        fontSize: 15.0,
                        letterSpacing: .6,
                        color: AppColors.text,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
          ...List.generate(
            state.newAddresses.length,
            (index) => AddressItem(
              showDeleteButton: true,
              text: state.newAddresses[index],
              onDelete: () => bloc.deleteAddresses(
                index: index,
                context: context,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
