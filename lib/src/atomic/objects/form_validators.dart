abstract class FormValidators {
  static String? Function(String? value) required(
      {String msg = 'Required field'}) {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return msg;
      }

      return null;
    };
  }
}
