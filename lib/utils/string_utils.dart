class StringUtils {
  StringUtils._();

  static String capitalize(String val) {
    return "${val[0].toUpperCase()}${val.substring(1)}";
  }

  static List<String>? splitFullName(String fullName) {
    List<String> nameParts = fullName.trim().split(' ');

    if (nameParts.length >= 2) {
      String firstName = nameParts[0];
      String lastName = nameParts.sublist(1).join(' ');

      return [firstName, lastName];
    } else {
      return null;
    }
  }
}
