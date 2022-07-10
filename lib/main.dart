import 'package:cconnect/menu_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';

import 'auth_page.dart';
import 'onboarding.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home: const OnBoarding(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
          body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const MainMenu();
          } else {
            return const AuthPage();
          }
        },
      ));
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   final controller = PageController();
//   bool isLastPage = false;
//
//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:
//       Container(
//         padding: const EdgeInsets.only(bottom: 80),
//         child: PageView(
//           controller: controller,
//           onPageChanged: (index) {
//             setState(() => isLastPage = index == 3); //pg start from 0,1,2,3
//           },
//           children: [
//             Container(
//               //pg1
//               color: const Color(0xFFFFFFFF),
//               child: Column(
//                 children: [
//                   UnDraw(
//                     padding: const EdgeInsets.only(top: 100, bottom: 75),
//                     color: Colors.blue,
//                     height: 240,
//                     width: 240,
//                     illustration: UnDrawIllustration.profile_data,
//                     placeholder: const CircularProgressIndicator(),
//                     errorWidget: const Icon(Icons.error_outline,
//                         color: Colors.red, size: 50),
//                   ),
//                   Container(
//                     padding: const EdgeInsets.only(bottom: 20),
//                     child: Text("Welcome To CConnect",
//                         style: GoogleFonts.poppins(
//                             fontSize: 25,
//                             color: const Color(0xFF4285F4),
//                             fontWeight: FontWeight.bold)),
//                   ),
//                   const Text(
//                     "CConnect helps you to organize and\nshare your social media account\nlike Youtube, Instagram, Line,\nTwitter and others seamlessly!",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 15),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               //pg2
//               color: const Color(0xFFFFFFFF),
//               child: Column(
//                 children: [
//                   UnDraw(
//                     padding: const EdgeInsets.only(top: 155, bottom: 60),
//                     color: Colors.blue,
//                     height: 200,
//                     width: 200,
//                     illustration: UnDrawIllustration.button_style,
//                     placeholder: const CircularProgressIndicator(),
//                     errorWidget: const Icon(Icons.error_outline,
//                         color: Colors.red, size: 50),
//                   ),
//                   Container(
//                     padding: const EdgeInsets.only(bottom: 20),
//                     child: Text(
//                         "Organize all your contacts\nthe way you wanted!",
//                         textAlign: TextAlign.center,
//                         style: GoogleFonts.poppins(
//                             fontSize: 25,
//                             color: const Color(0xFF4285F4),
//                             fontWeight: FontWeight.bold)),
//                   ),
//                   const Text(
//                     "With CConnect, any type of social\nmedia account can be stored inside\nCConnect and ready to share\nor receive contacts anytime!",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 15),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               //pg3
//               color: const Color(0xFFFFFFFF),
//               child: Column(
//                 children: [
//                   UnDraw(
//                     padding: const EdgeInsets.only(top: 100, bottom: 75),
//                     color: Colors.blue,
//                     height: 240,
//                     width: 240,
//                     illustration: UnDrawIllustration.connected_world,
//                     placeholder: const CircularProgressIndicator(),
//                     errorWidget: const Icon(Icons.error_outline,
//                         color: Colors.red, size: 50),
//                   ),
//                   Container(
//                     padding: const EdgeInsets.only(bottom: 20),
//                     child: Text(
//                       "Lost your device? No Problem!",
//                       style: GoogleFonts.poppins(
//                           fontSize: 25,
//                           color: const Color(0xFF4285F4),
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   const Text(
//                     "CConnect will store all your saved\ncontacts in the cloud, so you can\naccess them by using your account.",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 15),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               //pg4
//               color: const Color(0xFFFFFFFF),
//               child: Column(
//                 children: [
//                   UnDraw(
//                     padding: const EdgeInsets.only(top: 155, bottom: 60),
//                     color: Colors.blue,
//                     height: 200,
//                     width: 200,
//                     illustration: UnDrawIllustration.account,
//                     placeholder: const CircularProgressIndicator(),
//                     errorWidget: const Icon(Icons.error_outline,
//                         color: Colors.red, size: 50),
//                   ),
//                   Container(
//                     padding: const EdgeInsets.only(bottom: 20),
//                     child: Text(
//                       "Let's Get Started!",
//                       style: GoogleFonts.poppins(
//                           fontSize: 25,
//                           color: const Color(0xFF4285F4),
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   const Text(
//                     "Create your account right now\nto enjoy all CConnect benefits!",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 15),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomSheet: isLastPage
//           ? TextButton(
//               style: TextButton.styleFrom(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(0),
//                 ),
//                 primary: Colors.white,
//                 backgroundColor: Colors.teal.shade700,
//                 minimumSize: const Size.fromHeight(80),
//               ),
//               child: const Text(
//                 'Get Started',
//                 style: TextStyle(fontSize: 24),
//               ),
//               onPressed: () async {
//                 Get.to(() => const Login());
//               },
//             )
//           : Container(
//               padding: const EdgeInsets.symmetric(horizontal: 45),
//               height: 140,
//               color: const Color(0xFFFFFFFF),
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 50),
//                     child: Center(
//                       child: SmoothPageIndicator(
//                         controller: controller,
//                         count: 4,
//                         onDotClicked: (index) => controller.animateToPage(
//                           index,
//                           duration: const Duration(milliseconds: 200),
//                           curve: Curves.easeIn,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       TextButton(
//                         onPressed: () {
//                           controller.jumpToPage(3);
//                         },
//                         child: const Text(
//                           'Skip',
//                           style: TextStyle(
//                             color: Color(0xFF4285F4),
//                           ),
//                         ),
//                       ),
//                       TextButton.icon(
//                         icon: const Icon(Icons.keyboard_arrow_right),
//                         style: ButtonStyle(
//                           backgroundColor: MaterialStateProperty.all<Color>(
//                             const Color(0xFF07409E),
//                           ),
//                           padding: MaterialStateProperty.all<EdgeInsets>(
//                             const EdgeInsets.fromLTRB(30, 10, 30, 10),
//                           ),
//                         ),
//                         onPressed: () {
//                           controller.nextPage(
//                               duration: const Duration(milliseconds: 200),
//                               curve: Curves.easeInOut);
//                         },
//                         label: const Text(
//                           'Next',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }
// }
