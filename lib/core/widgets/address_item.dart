import 'package:flutter/material.dart';

import 'package:flutter_test_project/core/utils/app_colors.dart';

class AddressItem extends StatelessWidget {
  final String text;
  final bool showDeleteButton;
  final void Function()? onDelete;

  const AddressItem({
    Key? key,
    this.onDelete,
    required this.text,
    this.showDeleteButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.pin_drop, size: 26, color: Colors.grey),
          const SizedBox(width: 10.0),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16.0,
                letterSpacing: .6,
                color: AppColors.subtitle,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(width: 10.0),
          validateShowDeleteButton(),
        ],
      ),
    );
  }

  Widget validateShowDeleteButton() => showDeleteButton
      ? Column(
          children: [
            const SizedBox(width: 10.0),
            InkWell(
              onTap: onDelete,
              borderRadius: BorderRadius.circular(50),
              child: Icon(Icons.delete_forever, color: AppColors.error),
            ),
          ],
        )
      : const SizedBox();
}
