import 'package:cconnect/howtouse.dart';
import 'package:cconnect/menu_page.dart';
import 'package:cconnect/onboarding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    // Future handleSignOut() async {
    //   try {
    //     return await FirebaseAuth.instance.signOut();
    //   }catch (e){
    //     return (e);
    //   }
    // }
    return Scaffold(
      backgroundColor: const Color(0xFF39569E),
      body: Column(
        children: [
          const SizedBox(height: 38),
          Align(
            alignment: Alignment.topCenter,
            child: TextButton.icon(
              icon: const Icon(
                Icons.keyboard_arrow_left,
                color: Colors.white,
                size: 36,
              ),
              onPressed: () {
                Get.to(() => const MainMenu());
              },
              label: const Text(
                'Settings',
                style: TextStyle(color: Colors.white, fontSize: 36),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 80,
                    height: 60,
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: const Color(0xFF4285F4), width: 3),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.language,
                          size: 18, color: Color(0xFF4285F4)),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFFEFEEEE),
                          ),
                          alignment: Alignment.centerLeft),
                      label: const Text(
                        'Language',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      onPressed: () => FirebaseAuth.instance.signOut(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width - 80,
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xFF4285F4), width: 3),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.dark_mode,
                          size: 18, color: Color(0xFF4285F4)),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFFEFEEEE),
                          ),
                          alignment: Alignment.centerLeft),
                      label: const Text(
                        'Theme',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width - 80,
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xFF4285F4), width: 3),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.question_answer,
                          size: 18, color: Color(0xFF4285F4)),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFFEFEEEE),
                          ),
                          alignment: Alignment.centerLeft),
                      label: const Text(
                        'How To Use',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      onPressed: () {
                        Get.to(() => const HowToUse());
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width - 80,
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xFF4285F4), width: 3),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.people,
                          size: 18, color: Color(0xFF4285F4)),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFFEFEEEE),
                          ),
                          alignment: Alignment.centerLeft),
                      label: const Text(
                        'About Us',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width - 80,
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xFF4285F4), width: 3),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: TextButton.icon(
                      icon: const Icon(Icons.logout,
                          size: 18, color: Color(0xFF4285F4)),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFFEFEEEE),
                          ),
                          alignment: Alignment.centerLeft),
                      label: const Text(
                        'Log Out',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                        Get.to(() => const OnBoarding());
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
