import 'package:cconnect/read_friend_account.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'menu_page.dart';

class FriendAccount extends StatefulWidget {
  const FriendAccount({Key? key}) : super(key: key);

  @override
  State<FriendAccount> createState() => _FriendAccountState();
}

class _FriendAccountState extends State<FriendAccount> {
  final user = FirebaseAuth.instance.currentUser!;
  final friendAcc = FriendAccounts;

  List<String> docIDs = [];

  Future getDocumentId() async {
    await FirebaseFirestore.instance.collection(user.email!).get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            // print(friendAcc);
            docIDs.add(document.reference.id);
            // print(docIDs);
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accounts'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Expanded(
                child: FutureBuilder(
              future: getDocumentId(),
              builder: (context, snapshot) {
                return ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: GetFriendAccount(
                        documentId: 'accounts',
                      ),
                    );
                  },
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
