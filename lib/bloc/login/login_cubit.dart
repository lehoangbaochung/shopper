part of 'login_page.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.initial());

  void onUsernameChanged(String username) {
    emit(state.copyWith(username: username));
  }

  void onPasswordChanged(String password) {
    emit(state.copyWith(password: password));
  }

  bool login() {
    if (state.validate) {
      if (state.username == 'admin@' && state.password == '123123') {
        return true;
      }
    }
    return false;
  }
}
