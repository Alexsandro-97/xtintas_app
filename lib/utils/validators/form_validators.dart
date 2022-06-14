class Validators {
  static String? emptyValidator(String? text) {
    if (text == null || text.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }

  static String? emailValidator(String? text) {
    final emailRegex = RegExp(
      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?",
    );
    final emptyError = emptyValidator(text);
    if (emptyError == null && text != null) {
      if (!emailRegex.hasMatch(text)) {
        return 'Email inválido';
      }
    }
    return emptyError;
  }

  static String? passwordValidator(String? text) {
    final emptyError = emptyValidator(text);
    if (emptyError == null && text != null) {
      if (text.length < 8) {
        return 'Mínimo de 8 caracteres';
      }
    }
    return emptyError;
  }
}
