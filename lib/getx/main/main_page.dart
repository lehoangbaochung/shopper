import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../cart/cart_page.dart';

part 'main_binding.dart';
part 'main_controller.dart';

class MainPage extends GetWidget<MainController> {
  static const routeName = '/';
  static final items = Colors.primaries.map((color) => color);

  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) => Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: const Text('Catalog'),
                floating: true,
                forceElevated: innerBoxIsScrolled,
                automaticallyImplyLeading: false,
                actions: [
                  IconButton(
                    onPressed: () => Get.toNamed(CartPage.routeName),
                    icon: const Icon(Icons.shopping_cart),
                  ),
                ],
              ),
            ];
          },
          body: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items.elementAt(index);
              final exists = controller.items.contains(item).obs;
              return ListTile(
                key: ValueKey(item),
                leading: CircleAvatar(
                  backgroundColor: item,
                ),
                title: Text(item.value.toString()),
                trailing: Obx(
                  () => TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.amber,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: exists.value ? null : () => controller.add(item),
                    child: !exists.value ? const Text('ADD') : const Icon(Icons.check),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
