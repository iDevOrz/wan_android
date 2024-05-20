import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("请登录"),
      ),
      body: Form(
          child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: const InputDecoration(label: Text("帐号")),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(label: Text("密码")),
            ),
            const SizedBox(height: 100),
            FilledButton(onPressed: () {}, child: const Text("登录"))
          ],
        ),
      )),
    );
  }
}
