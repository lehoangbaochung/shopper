part of 'login_page.dart';

class LoginController extends GetxController {
  final usernameText = Rx<String>('');
  final passwordText = Rx<String>('');
  final errorUsernameText = Rxn<String>();
  final errorPasswordText = Rxn<String>();

  bool get validateUsername => usernameText.value.contains('@');
  bool get validatePassword => passwordText.value.length >= 6;
  bool get validate => validateUsername && validatePassword;

  void onUsernameChanged(String username) {
    usernameText.value = username;
    errorUsernameText.value = validateUsername ? null : 'Username must contains @';
  }

  void onPasswordChanged(String password) {
    passwordText.value = password;
    errorPasswordText.value = validatePassword ? null : 'Password must be at least 6 characters';
  }

  bool login() {
    if (validate) {
      if (usernameText.value == 'admin@' && passwordText.value == '123123') {
        return true;
      }
    }
    return false;
  }
}
