import 'package:flutter/material.dart';

import 'package:flutter_test_project/core/utils/app_colors.dart';

loading({required bool onWillPop, required BuildContext context}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.transparent,
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () {
          return Future.value(true);
        },
        child: Scaffold(
          backgroundColor:
              const Color.fromRGBO(216, 221, 225, 1).withOpacity(0.4),
          body: Center(
            child: CircularProgressIndicator(color: AppColors.primaryDark),
          ),
        ),
      );
    },
  );
}
