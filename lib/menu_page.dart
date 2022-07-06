import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Column(
        children: [
          const SizedBox(height: 100),
          ElevatedButton.icon(
            icon: const Icon(Icons.arrow_back, size: 32),
            label: const Text(
              'Sign Out',
              style: TextStyle(fontSize: 24),
            ),
            onPressed: () => FirebaseAuth.instance.signOut(),
          ),
        ],
      ),
    );
  }
}
