import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCreatePage extends StatefulWidget {
  const QRCreatePage({Key? key}) : super(key: key);

  @override
  State<QRCreatePage> createState() => _QRCreatePageState();
}

class _QRCreatePageState extends State<QRCreatePage> {
  final controller = FirebaseAuth.instance.currentUser!.email!;
  final user = FirebaseAuth.instance.currentUser!.email!.toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('QR Code'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QrImage(
                data: user,
                size: 200,
                backgroundColor: Colors.white,
              ),
              const SizedBox(height: 40),
              Text(
                'your account: $user',
                style: const TextStyle(
                    // color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                'Only give people your QR Code if\n you want to share it with someone!',
                // style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
