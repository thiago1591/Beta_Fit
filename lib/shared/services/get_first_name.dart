class Services {

  String getFirstName(String name) {
    final String firstName;
    if (name.contains(' ')) {
      int idx = name.indexOf(' ');
      firstName = name.substring(0, idx);
    } else {
      firstName = name;
    }
    return firstName;
  }

}
