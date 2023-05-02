

class RSTextUtils {
  bool isNonZeroNumericValue(String txt) {
    if (isTextNotEmptyOrNull(txt)) {
      try {
        return double.parse(txt) > 0;
      } catch (e) {
        return false;
      }
    }
    return false;
  }

  bool isTextNotEmptyOrNull(dynamic src) {
    // not null == true
    var value = src != null &&
        src.toString().isNotEmpty &&
        src != "null" &&
        src != "Null" &&
        src != "";
    return value;
  }

  String setNullTextToBlank(final String input) {
    return !isTextNotEmptyOrNull(input) ? "" : input;
  }

  String toTitleCase(String str) {
    if (str.isEmpty) {
      return str;
    }
    return str.substring(0, 1).toUpperCase() + str.substring(1);
  }
}
