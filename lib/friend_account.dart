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
// DocumentSnapshot variable = await FirebaseFirestore.instance.collection('users').doc('friend').get();

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'signed in as: ${user.email!}',
              style: const TextStyle(fontSize: 20),
            ),
            MaterialButton(
              onPressed: () {},
              color: Colors.deepPurple[200],
              child: const Text('sign out'),
            ),
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
