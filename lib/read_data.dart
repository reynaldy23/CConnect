import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetUserName extends StatelessWidget {
  final String documentId;

  GetUserName({required this.documentId});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    CollectionReference users = FirebaseFirestore.instance.collection(user.email!);

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),

      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text('${data['friend']}');
        }
        return const Text('loading..');
      }),
    );
  }
}
