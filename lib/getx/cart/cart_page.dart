import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/getx/main/main_page.dart';

class CartPage extends StatelessWidget {
  static const routeName = '/cart';

  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: Get.find<MainController>(),
      builder: (controller) {
        final items = controller.items.value;
        final price = items.map((item) => item.value).reduce((value, element) => value + element) / 1000000;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Cart'),
          ),
          body: ListView.builder(
            padding: const EdgeInsets.all(8).copyWith(
              bottom: kBottomNavigationBarHeight,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items.elementAt(index);
              return ListTile(
                leading: const Icon(Icons.check),
                title: Text(item.value.toString()),
                trailing: IconButton(
                  onPressed: () => controller.remove(item),
                  icon: const Icon(Icons.remove_circle_outline),
                ),
              );
            },
          ),
          bottomSheet: ListTile(
            shape: const Border.symmetric(
              horizontal: BorderSide(),
            ),
            title: Text(
              '\$${price.round()}',
              textAlign: TextAlign.center,
            ),
            trailing: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Get.snackbar(
                  'Buy',
                  'Buying not supported yet!',
                  snackPosition: SnackPosition.BOTTOM,
                  duration: const Duration(seconds: 2),
                );
              },
              child: const Text('BUY'),
            ),
          ),
        );
      },
    );
  }
}
