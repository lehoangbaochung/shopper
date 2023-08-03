part of 'login_page.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.initial());

  void onUsernameChanged(String username) {
    emit(state.copyWith(usernameText: username));
  }

  void onPasswordChanged(String password) {
    emit(state.copyWith(passwordText: password));
  }

  bool login() {
    if (state.validate) {
      if (state.usernameText == 'admin@' && state.passwordText == '123123') {
        return true;
      }
    }
    return false;
  }
}
