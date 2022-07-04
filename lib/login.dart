import 'package:cconnect/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF3F5A9E),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 80),
            const Text(
              'Welcome To',
              style: TextStyle(color: Colors.white),
            ),
            const Text(
              'CConnect',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 80),
            TextField(
              style: const TextStyle(color: Colors.white),
              controller: emailController,
              cursorColor: Colors.white,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(

                labelText: 'E-mail Address',
                labelStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(Icons.email, color: Colors.white),
              ),
            ),
            const SizedBox(height: 4),
            TextField(
              controller: passwordController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(Icons.password, color: Colors.white),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 80),
            TextButton(
              onPressed: () {},
              child: const Text('Login'),
            )
          ],
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        height: 190,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const Text('or connect with'),
                TextButton(
                    onPressed: () {
                      Get.to(() => const MyHomePage());
                    },
                    child: const Text('Google')),
                const TextButton(onPressed: null, child: Text('Google')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
