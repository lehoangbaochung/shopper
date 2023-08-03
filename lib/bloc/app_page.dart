import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login/login_page.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopper_Bloc',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => LoginCubit(),
        child: const LoginPage(),
      ),
      theme: ThemeData(
        fontFamily: 'BeVietnamPro',
        primarySwatch: Colors.amber,
      ),
    );
  }
}
