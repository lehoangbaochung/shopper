part of 'main_page.dart';

class MainBinding implements Bindings {
  const MainBinding();

  @override
  void dependencies() {
    Get.lazyPut(() => MainController());
  }
}
