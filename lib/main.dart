import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ms_undraw/ms_undraw.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          // scrollDirection: Axis.vertical,
          children: [
            Container(
              //pg1
              color: const Color(0xFFFFFFFF),
              child: Column(
                children: [
                  UnDraw(
                    padding: const EdgeInsets.only(top: 100, bottom: 75),
                    color: Colors.blue,
                    height: 240,
                    width: 240,
                    illustration: UnDrawIllustration.profile_data,
                    placeholder: const CircularProgressIndicator(),
                    errorWidget: const Icon(Icons.error_outline,
                        color: Colors.red, size: 50),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text("Welcome To CConnect",
                        style: GoogleFonts.poppins(
                            fontSize: 25,
                            color: const Color(0xFF4285F4),
                            fontWeight: FontWeight.bold)),
                  ),
                  const Text(
                    "CConnect helps you to organize and\nshare your social media account\nlike Youtube, Instagram, Line,\nTwitter and others seamlessly!",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
            Container(
              //pg2
              color: const Color(0xFFFFFFFF),
              child: Column(
                children: [
                  UnDraw(
                    padding: const EdgeInsets.only(top: 155, bottom: 60),
                    color: Colors.blue,
                    height: 200,
                    width: 200,
                    illustration: UnDrawIllustration.button_style,
                    placeholder: const CircularProgressIndicator(),
                    errorWidget: const Icon(Icons.error_outline,
                        color: Colors.red, size: 50),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                        "Organize all your contacts\nthe way you wanted!",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontSize: 25,
                            color: const Color(0xFF4285F4),
                            fontWeight: FontWeight.bold)),
                  ),
                  const Text(
                    "With CConnect, any type of social\nmedia account can be stored inside\nCConnect and ready to share\nor receive contacts anytime!",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
            Container(
              //pg3
              color: const Color(0xFFFFFFFF),
              child: Column(
                children: [
                  UnDraw(
                    padding: const EdgeInsets.only(top: 100, bottom: 75),
                    color: Colors.blue,
                    height: 240,
                    width: 240,
                    illustration: UnDrawIllustration.connected_world,
                    placeholder: const CircularProgressIndicator(),
                    errorWidget: const Icon(Icons.error_outline,
                        color: Colors.red, size: 50),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text("Lost your device? No Problem!",
                        style: GoogleFonts.poppins(
                            fontSize: 25,
                            color: const Color(0xFF4285F4),
                            fontWeight: FontWeight.bold)),
                  ),
                  const Text(
                    "CConnect will store all your saved\ncontacts in the cloud, so you can\naccess them by using your account.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
            Container(
              //pg4
              color: const Color(0xFFFFFFFF),
              child: Column(
                children: [
                  UnDraw(
                    padding: const EdgeInsets.only(top: 155, bottom: 60),
                    color: Colors.blue,
                    height: 200,
                    width: 200,
                    illustration: UnDrawIllustration.account,
                    placeholder: const CircularProgressIndicator(),
                    errorWidget: const Icon(Icons.error_outline,
                        color: Colors.red, size: 50),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text("Let's Get Started!",
                        style: GoogleFonts.poppins(
                            fontSize: 25,
                            color: const Color(0xFF4285F4),
                            fontWeight: FontWeight.bold)),
                  ),
                  const Text(
                    "Create your account right now\nto enjoy all CConnect benefits!",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 45),
        height: 140,
        color: const Color(0xFFFFFFFF),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Center(
                child: SmoothPageIndicator(
                  controller: controller,
                  count: 4,
                  onDotClicked: (index) => controller.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeIn,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      controller.jumpToPage(3);
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(color: Color(0xFF4285F4)),
                    )),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF07409E)),
                    padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.fromLTRB(30, 10, 30, 10))
                  ),
                  onPressed: () {
                    controller.nextPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut);
                  },
                  child: const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: 'Next',
                        style: TextStyle(color: Colors.white)),
                        TextSpan(text: '     '),
                        WidgetSpan(child: Icon(Icons.keyboard_arrow_right)),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}