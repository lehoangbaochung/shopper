import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cart/cart_page.dart';
import 'login/login_page.dart';
import 'main/main_page.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Shopper_Getx',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'BeVietnamPro',
        primarySwatch: Colors.amber,
      ),
      initialRoute: LoginPage.routeName,
      unknownRoute: GetPage(
        name: '/error',
        page: () => const Placeholder(),
      ),
      getPages: [
        GetPage(
          name: LoginPage.routeName,
          page: () => const LoginPage(),
          binding: const LoginBinding(),
        ),
        GetPage(
          name: MainPage.routeName,
          page: () => const MainPage(),
          binding: const MainBinding(),
        ),
        GetPage(
          name: CartPage.routeName,
          page: () => const CartPage(),
        ),
      ],
    );
  }
}
