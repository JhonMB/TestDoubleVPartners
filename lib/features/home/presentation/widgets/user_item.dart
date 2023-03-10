import 'package:flutter/material.dart';

import 'package:flutter_test_project/core/utils/app_colors.dart';

class UserItem extends StatelessWidget {
  final String name;
  final String birthdate;
  final void Function() onTap;
  final void Function() onEdit;
  final void Function() onDelete;

  const UserItem({
    super.key,
    required this.name,
    required this.onTap,
    required this.onEdit,
    required this.onDelete,
    required this.birthdate,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          radius: 26.0,
          backgroundColor: Colors.grey.shade200,
          child: const Icon(Icons.person, size: 28.0, color: Colors.grey),
        ),
        title: Text(name, style: const TextStyle(letterSpacing: .6)),
        subtitle: Text(birthdate, style: const TextStyle(letterSpacing: .6)),
        trailing: SizedBox(
          width: 60,
          child: Row(
            children: [
              InkWell(
                onTap: onDelete,
                borderRadius: BorderRadius.circular(50),
                child: Icon(Icons.delete_forever, color: AppColors.error),
              ),
              const SizedBox(width: 10.0),
              InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: onEdit,
                child: Icon(Icons.edit_outlined, color: AppColors.primaryDark),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
