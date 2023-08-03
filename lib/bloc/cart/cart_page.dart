import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/bloc/main/main_page.dart';

class CartPage extends StatelessWidget {
  static const routeName = '/cart';

  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = context.watch<MainCubit>().state.items;
    final price = items.isEmpty ? 0 : items.map((item) => item.value).reduce((value, element) => value + element) / 1000000;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: items.isEmpty
          ? const Center(child: Text('EMPTY'))
          : ListView.builder(
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
                    onPressed: () => context.read<MainCubit>().remove(item),
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
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                  content: Text('Buying not supported yet!'),
                  duration: Duration(seconds: 2),
                ),
              );
          },
          child: const Text('BUY'),
        ),
      ),
    );
  }
}
