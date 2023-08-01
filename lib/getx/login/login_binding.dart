part of 'login_page.dart';

class LoginBinding implements Bindings {
  const LoginBinding();
  
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
