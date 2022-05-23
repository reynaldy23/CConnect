import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ms_undraw/ms_undraw.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
              color: const Color(0xFFFFFFFF),
              child: Column(
                children: [
                  UnDraw(
                    padding: const EdgeInsets.only(top: 100, bottom: 70),
                    color: Colors.blue,
                    height: 260,
                    width: 260,
                    illustration: UnDrawIllustration.profile_image,
                    placeholder: const CircularProgressIndicator(),
                    errorWidget: const Icon(Icons.error_outline,
                        color: Colors.red, size: 50),
                  ),
                  Container(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: const Text("Welcome To CConnect")),
                  const Text(
                    "CConnect helps you to organize and \n share your social media account\n like Youtube, Instagram, Line,\nTwitter and others seamlessly!",
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
            ),
            Container(
              color: const Color(0xFFFFFFFF),
              child: Center(
                child: UnDraw(
                  color: Colors.blue,
                  height: 280,
                  width: 280,
                  illustration: UnDrawIllustration.profile_image,
                  placeholder: const CircularProgressIndicator(),
                  errorWidget: const Icon(Icons.error_outline,
                      color: Colors.red, size: 50),
                ),
              ),
            ),
            Container(
              color: const Color(0xFFFFFFFF),
              child: Center(
                child: UnDraw(
                  color: Colors.blue,
                  height: 280,
                  width: 280,
                  illustration: UnDrawIllustration.profile_image,
                  placeholder: const CircularProgressIndicator(),
                  errorWidget: const Icon(Icons.error_outline,
                      color: Colors.red, size: 50),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        height: 80,
        color: const Color(0xFFFFFFFF),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () {
                  controller.jumpToPage(2);
                },
                child: const Text('SKIP')),
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: WormEffect(
                  spacing: 16,
                  dotColor: Colors.black26,
                  activeDotColor: Colors.teal.shade700,
                ),
                onDotClicked: (index) => controller.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeIn,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                controller.nextPage(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut);
              },
              child: const Text('NEXT'),
            ),
          ],
        ),
      ),
    );
  }
}
