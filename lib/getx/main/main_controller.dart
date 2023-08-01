part of 'main_page.dart';

class MainController extends GetxController {
  final items = Rx<Iterable<Color>>([]);

  void add(Color item) {
    items.value = items.value.toList()..add(item);
    update();
  }

  void remove(Color item) {
    items.value = items.value.toList()..remove(item);
    update();
  }
}
