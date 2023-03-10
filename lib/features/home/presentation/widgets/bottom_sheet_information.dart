import 'package:flutter/material.dart';
import 'package:bottom_sheet/bottom_sheet.dart';

import 'package:flutter_test_project/core/models/user_model.dart';
import 'package:flutter_test_project/core/utils/app_colors.dart';
import 'package:flutter_test_project/core/widgets/address_item.dart';

void bottomSheetInformation({
  required UserModel user,
  required BuildContext context,
}) {
  showFlexibleBottomSheet<void>(
    minHeight: 0.0,
    maxHeight: 1.0,
    initHeight: 0.5,
    context: context,
    isSafeArea: true,
    anchors: [0.0, 0.5, 1.0],
    bottomSheetColor: Colors.white,
    builder: (context, controller, offset) {
      return ListView(
        controller: controller,
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(height: 100.0, color: Colors.grey.shade100),
              Positioned(
                left: 16,
                bottom: -46,
                child: CircleAvatar(
                  radius: 46.0,
                  backgroundColor: Colors.grey.shade200,
                  child: const Icon(Icons.person, size: 58, color: Colors.grey),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 70,
              left: 16,
              right: 16,
              bottom: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${user.names} ${user.surnames}".toUpperCase(),
                  style: TextStyle(
                    fontSize: 22.0,
                    letterSpacing: 1,
                    color: AppColors.title,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6.0),
                Text(
                  user.birthdate,
                  style: TextStyle(
                    fontSize: 16.0,
                    letterSpacing: .6,
                    color: AppColors.subtitle,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20.0),
                Text(
                  'Direcciones',
                  style: TextStyle(
                    fontSize: 18.0,
                    letterSpacing: .6,
                    color: AppColors.subtitle,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10.0),
                user.addresses.isEmpty
                    ? Padding(
                        padding: const EdgeInsets.only(top: 50.0),
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
                  user.addresses.length,
                  (index) => AddressItem(text: user.addresses[index]),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}
