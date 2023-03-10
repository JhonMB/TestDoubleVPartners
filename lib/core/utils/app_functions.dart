import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_test_project/core/widgets/text_field_custom.dart';

class AppFunctions {
  static DateTime formatDate(String dateTime) =>
      DateFormat("dd/MM/yyyy").parse(dateTime);

  static String? textFieldValidator({
    required String? text,
    required TextFieldType type,
  }) {
    if (text!.replaceAll(" ", "").isEmpty) {
      return 'Campo requerido';
    } else if (type == TextFieldType.name &&
        text.replaceAll(" ", "").length < 4) {
      return 'Nombre muy corto';
    } else if (type == TextFieldType.lastName &&
        text.replaceAll(" ", "").length < 4) {
      return 'Apellido muy corto';
    } else {
      return null;
    }
  }
}
