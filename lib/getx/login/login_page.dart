import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main/main_page.dart';

part 'login_binding.dart';
part 'login_controller.dart';

class LoginPage extends GetWidget<LoginController> {
  static const routeName = '/login';

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var obscurePassword = true;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
            ),
            const SizedBox(height: 16),
            Text(
              'Welcome, Getx!',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Obx(
              () => TextField(
                decoration: InputDecoration(
                  hintText: 'Username',
                  errorText: controller.errorUsernameText.value,
                ),
                onChanged: (value) => controller.onUsernameChanged(value),
              ),
            ),
            StatefulBuilder(
              builder: (context, setState) {
                return Obx(
                  () => TextField(
                    obscureText: obscurePassword,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      errorText: controller.errorPasswordText.value,
                      suffix: IconButton(
                        onPressed: () {
                          setState(() {
                            obscurePassword = !obscurePassword;
                          });
                        },
                        icon: Icon(
                          obscurePassword ? Icons.visibility : Icons.visibility_off,
                        ),
                      ),
                    ),
                    onChanged: (value) => controller.onPasswordChanged(value),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            Obx(
              () => ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: !controller.validate
                    ? null
                    : () {
                        final validate = controller.login();
                        if (validate) {
                          Get.offAndToNamed(MainPage.routeName);
                        } else {
                          Get.snackbar(
                            'Login',
                            'Login Failture!',
                            snackPosition: SnackPosition.BOTTOM,
                            duration: const Duration(seconds: 2),
                          );
                        }
                      },
                child: const Text('Enter'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
