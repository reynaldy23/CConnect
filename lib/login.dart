import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  final VoidCallback onClickedSignUp;

  const Login({
    Key? key,
    required this.onClickedSignUp,
  }) : super(key: key);

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
    // Get.to(() => const OnBoarding());
    Future signIn() async {
      // showDialog(context: context,
      //     barrierDismissible: false,
      //     builder: (context) => const Center(child: CircularProgressIndicator()));
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
      } on FirebaseAuthException catch (e) {
        print(e);
      }
      // navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }

    return SingleChildScrollView(
      child: Container(
        color: const Color(0xFF3F5A9E),
        height: MediaQuery.of(context).size.height,
        child: Column(
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
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF1190EE),
                      ),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 145),
                      primary: Colors.white,
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: signIn,
                    child: const Text('Login'),
                  )
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: RichText(
                text: TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = widget.onClickedSignUp,
                  text: 'Don\'t have an account? ',
                  children: <TextSpan>[
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = widget.onClickedSignUp,
                      text: 'Sign Up Here!',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF62BCFF),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Container(
              color: Colors.white,
              height: 138,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 18),
                      const Text('or connect with'),
                      const SizedBox(height: 15),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Stack(
                          children: <Widget>[
                            Positioned.fill(
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Color(0xFF1190EE),
                                ),
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                primary: Colors.white,
                                textStyle: const TextStyle(fontSize: 18),
                              ),
                              onPressed: () {
                                // Get.to(() => const MyHomePage());
                              },
                              child: const Text('Google'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
