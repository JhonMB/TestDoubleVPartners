import 'package:flutter/material.dart';

import 'package:flutter_test_project/core/utils/app_colors.dart';
import 'package:flutter_test_project/core/utils/screen_size.dart';

popUp({
  OkButton? okButton,
  required String title,
  required Widget content,
  CancelButton? cancelButton,
  required BuildContext context,
}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        insetPadding: ScreenSize.height(context) <= 684
            ? const EdgeInsets.symmetric(horizontal: 16.0)
            : const EdgeInsets.symmetric(vertical: 24, horizontal: 35),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(14.0, 0.0, 14.0, 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _title(title: title, context: context),
              Flexible(child: _content(content)),
              _actions(
                context: context,
                okButton: okButton ?? okButtonDefined(context),
                cancelButton: cancelButton ?? cancelButtonDefined(context),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget _title({required String title, required BuildContext context}) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 14.0),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          letterSpacing: 1.0,
          color: AppColors.title,
          fontWeight: FontWeight.bold,
          fontSize: ScreenSize.width(context) * 0.041,
        ),
      ),
    ),
  );
}

Widget _content(Widget content) {
  return SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    padding: const EdgeInsets.fromLTRB(1.0, 0.0, 1.0, 16.0),
    child: content,
  );
}

_actions({
  required OkButton okButton,
  required BuildContext context,
  required CancelButton cancelButton,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      TextButton(
        onPressed: cancelButton.cancelButton,
        style: styleTextButton(),
        child: Text(
          cancelButton.cancelButtonTitle,
          style: TextStyle(
            letterSpacing: 0.88,
            color: AppColors.subtitle,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      const SizedBox(width: 10.0),
      TextButton(
        style: styleTextButton(),
        onPressed: okButton.okButton,
        child: Text(
          okButton.okButtonTitle,
          style: TextStyle(
            letterSpacing: 0.88,
            fontWeight: FontWeight.w400,
            color: okButton.okButton == null
                ? AppColors.subtitle
                : AppColors.success,
          ),
        ),
      ),
    ],
  );
}

styleTextButton() => ButtonStyle(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0)),
    );

class OkButton {
  final String okButtonTitle;
  final void Function()? okButton;

  OkButton({this.okButton, this.okButtonTitle = 'Aceptar'});
}

class CancelButton {
  final String cancelButtonTitle;
  final void Function()? cancelButton;

  const CancelButton({this.cancelButton, this.cancelButtonTitle = 'Cancelar'});
}

CancelButton cancelButtonDefined(BuildContext context) => CancelButton(
      cancelButtonTitle: 'Cancelar',
      cancelButton: () => Navigator.of(context).pop(),
    );

OkButton okButtonDefined(BuildContext context) => OkButton(
      okButtonTitle: 'Aceptar',
      okButton: () => Navigator.of(context).pop(),
    );
