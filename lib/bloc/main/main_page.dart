import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/bloc/cart/cart_page.dart';

part 'main_cubit.dart';
part 'main_state.dart';

class MainPage extends StatelessWidget {
  static const routeName = '/';
  static final items = Colors.primaries.map((color) => color);

  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return Scaffold(
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) {
                              return BlocProvider.value(
                                value: context.read<MainCubit>(),
                                child: const CartPage(),
                              );
                            },
                          ),
                        );
                      },
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
                final exists = state.items.contains(item); 
                return ListTile(
                  key: ValueKey(item),
                  leading: CircleAvatar(
                    backgroundColor: item,
                  ),
                  title: Text(item.value.toString()),
                  trailing: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.amber,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: exists ? null : () => context.read<MainCubit>().add(item),
                    child: !exists ? const Text('ADD') : const Icon(Icons.check),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
