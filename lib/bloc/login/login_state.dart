part of 'login_page.dart';

class LoginState {
  final String usernameText;
  final String passwordText;

  const LoginState._({
    required this.usernameText,
    required this.passwordText,
  });

  factory LoginState.initial() {
    return const LoginState._(
      usernameText: '',
      passwordText: '',
    );
  }

  bool get validateUsername => usernameText.contains('@');
  bool get validatePassword => passwordText.length >= 6;
  bool get validate => validateUsername && validatePassword;
  
  String? get errorUsernameText => usernameText.isEmpty || validateUsername ? null : 'Username must contains @';
  String? get errorPasswordText => passwordText.isEmpty || validatePassword ? null : 'Password must be at least 6 characters';

  LoginState copyWith({
    String? usernameText,
    String? passwordText,
  }) {
    return LoginState._(
      usernameText: usernameText ?? this.usernameText,
      passwordText: passwordText ?? this.passwordText,
    );
  }
}
