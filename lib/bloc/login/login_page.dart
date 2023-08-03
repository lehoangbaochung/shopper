import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/bloc/main/main_page.dart';

part 'login_cubit.dart';
part 'login_state.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/login';

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var obscurePassword = true;
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
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
                  'Welcome, Bloc!',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Username',
                    errorText: state.errorUsernameText,
                  ),
                  onChanged: (value) => context.read<LoginCubit>().onUsernameChanged(value),
                ),
                StatefulBuilder(
                  builder: (context, setState) {
                    return TextField(
                      obscureText: obscurePassword,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        errorText: state.errorPasswordText,
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
                      onChanged: (value) => context.read<LoginCubit>().onPasswordChanged(value),
                    );
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: !state.validate
                      ? null
                      : () {
                          final validate = context.read<LoginCubit>().login();
                          if (validate) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) {
                                  return BlocProvider(
                                    create: (_) => MainCubit(),
                                    child: const MainPage(),
                                  );
                                },
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(
                                const SnackBar(
                                  content: Text('Login Failture!'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                          }
                        },
                  child: const Text('Enter'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
