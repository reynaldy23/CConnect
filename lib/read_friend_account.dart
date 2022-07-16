import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class GetFriendAccount extends StatelessWidget {
  final String documentId;

  GetFriendAccount({required this.documentId});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    print(documentId);
    CollectionReference users =
        FirebaseFirestore.instance.collection(user.email!);
    print(users);

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc('accounts').get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.black, fontSize: 18),
              children: [
                const TextSpan(text: 'email:\n'),
                TextSpan(
                  text: '${data['email']}\n',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      launchUrl(Uri.parse(data['email']));
                    },
                ),
                const TextSpan(text: 'instagram:\n'),
                TextSpan(
                  text: '${data['instagram']}\n',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      launchUrl(Uri.parse(data['instagram']));
                    },
                ),
                const TextSpan(text: 'facebook:\n'),
                TextSpan(
                  text: '${data['facebook']}\n',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      launchUrl(Uri.parse(data['facebook']));
                    },
                ),
                const TextSpan(text: 'twitter:\n'),
                TextSpan(
                  text: '${data['twitter']}\n',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      launchUrl(Uri.parse(data['twitter']));
                    },
                ),
                const TextSpan(text: 'line:\n'),
                TextSpan(
                  text: '${data['line']}\n',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      launchUrl(Uri.parse(data['line']));
                    },
                ),
                const TextSpan(text: 'linkedin:\n'),
                TextSpan(
                  text: '${data['linkedin']}\n',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      launchUrl(Uri.parse(data['linkedin']));
                    },
                ),
              ],
            ),
          );
        }
        return const Text('loading..');
      }),
    );
  }
}
