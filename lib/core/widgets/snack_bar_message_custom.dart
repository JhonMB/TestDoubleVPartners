import 'package:flutter/material.dart';

import 'package:flutter_test_project/core/utils/app_colors.dart';

enum SnackBarType { imfo, error, warning, success }

snackBarMessageCustom({
  required String message,
  required BuildContext context,
  SnackBarType snackBarType = SnackBarType.imfo,
}) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        padding: const EdgeInsets.only(bottom: 14.0, left: 10.0, right: 10.0),
        content: Row(
          children: [
            Expanded(
              child: Material(
                elevation: 6.0,
                borderRadius: BorderRadius.circular(10.0),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  color: validateColorsnackBar(snackBarType),
                  child: Text(
                    message,
                    style: TextStyle(
                      letterSpacing: .6,
                      fontWeight: FontWeight.w600,
                      color: snackBarType == SnackBarType.imfo
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

validateColorsnackBar(SnackBarType snackBarType) {
  switch (snackBarType) {
    case SnackBarType.imfo:
      return Colors.grey;

    case SnackBarType.error:
      return Colors.red;

    case SnackBarType.warning:
      return AppColors.warning;

    case SnackBarType.success:
      return AppColors.success;

    default:
      return Colors.grey;
  }
}
