part of 'login_page.dart';

class LoginState {
  final String username;
  final String password;

  const LoginState._({
    required this.username,
    required this.password,
  });

  factory LoginState.initial() {
    return const LoginState._(
      username: '',
      password: '',
    );
  }

  bool get validateUsername => username.contains('@');
  bool get validatePassword => password.length >= 6;
  bool get validate => validateUsername && validatePassword;
  String? get errorUsernameText => username.isEmpty || validateUsername ? null : 'Username must contains @';
  String? get errorPasswordText => password.isEmpty || validatePassword ? null : 'Password must be at least 6 characters';

  LoginState copyWith({
    String? username,
    String? password,
  }) {
    return LoginState._(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }
}
