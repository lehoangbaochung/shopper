part of 'main_page.dart';

class MainController extends GetxController {
  final items = RxList<Color>([]);

  void add(Color item) {
    items.add(item);
    update();
  }

  void remove(Color item) {
    items.remove(item);
    update();
  }
}
