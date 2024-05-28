import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wan_android/feature/profile/presentation/login/login_controller.dart';
import 'package:wan_android/services/error_handler.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ref.listen(loginControllerProvider, (previous, next) {
      if (next.hasError) {
        ErrorHandler().call(context, error: next.error!);
      } else if (next.hasValue) {
        Navigator.of(context).pop();
      }
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("请登录"),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusScope.of(context).unfocus(),
        child: Form(
            child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: const InputDecoration(label: Text("帐号")),
                controller: _usernameController,
              ),
              const SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(label: Text("密码")),
                controller: _passwordController,
              ),
              const SizedBox(height: 100),
              FilledButton(
                onPressed: () => _loginAction(context),
                child: const Text("登录"),
              )
            ],
          ),
        )),
      ),
    );
  }

  Future _loginAction(BuildContext context) async {
    final username = _usernameController.text;
    final password = _passwordController.text;
    return ref
        .watch(loginControllerProvider.notifier)
        .login(username: username, password: password);
  }
}
