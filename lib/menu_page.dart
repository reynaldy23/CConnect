import 'package:cconnect/add_profile.dart';
import 'package:cconnect/qr_create_page.dart';
import 'package:cconnect/qr_scan_page.dart';
import 'package:cconnect/read_data.dart';
import 'package:cconnect/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  final user = FirebaseAuth.instance.currentUser!;

  List<String> docIDs = [];

  Future getDocId() async {
    await FirebaseFirestore.instance.collection(user.email!).get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            docIDs.add(document.reference.id);
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            color: const Color(0xFF39569E),
            height: 310,
            width: double.maxFinite,
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Column(
                  //crossAxisAlignment
                  children: [
                    const SizedBox(height: 48),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const AddProfile());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Hi, ${user.email!}',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                          const SizedBox(width: 138),
                          IconButton(
                            icon:
                                const Icon(Icons.settings, color: Colors.white),
                            onPressed: () {
                              setState((){});
                              Get.to(() => const SettingsPage());
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 180,
                  child: Container(
                    height: 170,
                    width: 376,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                      color: const Color(0xFF1190EE),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Scan QR Code Here to\nFind Your Friend',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton.icon(
                              icon: const Icon(Icons.qr_code,
                                  color: Color(0xFF4285F4)),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  const Color(0xFFFFFFFF),
                                ),
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                  const EdgeInsets.fromLTRB(20, 12, 20, 12),
                                ),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Get.to(() => const QRScanPage());
                              },
                              label: const Text(
                                'Scan QR Code',
                                style: TextStyle(
                                    color: Color(0xFF4285F4),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            TextButton.icon(
                              icon: const Icon(Icons.document_scanner,
                                  color: Color(0xFF4285F4)),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  const Color(0xFFFFFFFF),
                                ),
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                  const EdgeInsets.fromLTRB(20, 12, 20, 12),
                                ),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Get.to(() => const QRCreatePage());
                              },
                              label: const Text(
                                'Show QR Code',
                                style: TextStyle(
                                  color: Color(0xFF4285F4),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 55,
          ),
          Row(
            children: [
              const SizedBox(width: 28),
              RichText(
                text: TextSpan(
                  children: [
                    const WidgetSpan(
                      child: Icon(
                        Icons.person_add,
                        size: 30,
                        color: Color(0xFF1190EE),
                      ),
                    ),
                    TextSpan(
                      text: ' Contacts',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
              child: FutureBuilder(
            future: getDocId(),
            builder: (context, snapshot) {
              return ListView.builder(
                itemCount: docIDs.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: GetUserName(
                      documentId: docIDs[index],
                    ),
                  );
                },
              );
            },
          )),
        ],
      ),
    );
  }
}

// onPressed: () async {
// DocumentSnapshot variable = await FirebaseFirestore.instance.collection('users').doc('email').get();
// print(variable['email']);
// },
