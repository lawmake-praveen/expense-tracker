class Validators {
  static String? requriedField(value) {
    if (value == null) {
      return "Required field";
    }
    if (value == '') {
      return "Required field";
    }
    return null;
  }
}
