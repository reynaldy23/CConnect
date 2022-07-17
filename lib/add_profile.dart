import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import 'menu_page.dart';

class AddProfile extends StatefulWidget {
  const AddProfile({Key? key}) : super(key: key);

  @override
  State<AddProfile> createState() => _AddProfileState();
}

class _AddProfileState extends State<AddProfile> {
  final controllerEmail = TextEditingController();
  final controllerInstagram = TextEditingController();
  final controllerFacebook = TextEditingController();
  final controllerLinkedIn = TextEditingController();
  final controllerLine = TextEditingController();
  final controllerTwitter = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Accounts'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            // TextField(
            //   // enabled: false,
            //   controller: controllerEmail,
            //   decoration: const InputDecoration(
            //       border: OutlineInputBorder(), hintText: 'E-mail'),
            //   keyboardType: TextInputType.emailAddress,
            // ),
            // const SizedBox(height: 24),
            TextField(
              controller: controllerInstagram,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Instagram (username)'),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: controllerFacebook,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'FaceBook (username)'),
              // keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 24),
            TextField(
              controller: controllerLinkedIn,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'LinkedIn (username)'),
              // keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 24),
            TextField(
              controller: controllerLine,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Line ID'),
              // keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 24),
            TextField(
              controller: controllerTwitter,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Twitter (username)'),
              // keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                final user = User(
                  email: controllerEmail.text,
                  instagram: controllerInstagram.text,
                  facebook: controllerFacebook.text,
                  linkedin: controllerLinkedIn.text,
                  line: controllerLine.text,
                  twitter: controllerTwitter.text,
                );
                createUser(user);
                Get.to(() => const MainMenu());
              },
              child: const Text('Update'),
            )
          ],
        ),
      );

  Future createUser(User user) async {
    final docUser = FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser!.email!.toString())
        .doc('accounts');
    user.id = docUser.id;

    final json = user.toJson();
    await docUser.set(json);
  }
}

class User {
  String id;
  final String email;
  final String instagram;
  final String facebook;
  final String linkedin;
  final String line;
  final String twitter;

  User(
      {this.id = '',
      required this.email,
      required this.instagram,
      required this.facebook,
      required this.linkedin,
      required this.line,
      required this.twitter});

  Map<String, dynamic> toJson() => {
        'email': FirebaseAuth.instance.currentUser!.email!,
        'instagram': 'https://www.instagram.com/$instagram',
        'facebook': 'https://www.facebook.com/$facebook',
        'linkedin': 'https://www.linkedin.com/in/$linkedin',
        'twitter': 'https://www.twitter.com/$twitter',
        'line': line,
      };

  static User fromJson(Map<String, dynamic> json) => User(
      email: json['email'],
      instagram: json['instagram'],
      facebook: json['facebook'],
      linkedin: json['linkedin'],
      twitter: json['twitter'],
      line: json['line']);
}
