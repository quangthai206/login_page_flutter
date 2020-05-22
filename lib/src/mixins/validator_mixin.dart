class Validator {
  String checkEmail(String email) {
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    if (!emailValid) {
      return 'Invalid email address.';
    }
    return null;
  }

  String checkPassword(String password) {
    if (password.length < 6) {
      return 'Password must be at least 6 characters.';
    }
    return null;
  }
}