import 'package:flutter/material.dart';
import 'package:flutter_getx_clean_architecture/core/presentation/widgets/base_get_page.dart';
import 'package:flutter_getx_clean_architecture/features/login/presentation/controller/login_controller.dart';

class LoginPage extends BaseGetPage<LoginController> {
  LoginPage({super.key});

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: controller.login,
          child: const Text('Login'),
        ),
      ),
    );
  }
}
