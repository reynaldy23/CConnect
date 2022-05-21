import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  void dispose(){
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
              color: Colors.red,
              child: const Center(child: Text('Page 1')),
            ),
            Container(
              color: Colors.indigo,
              child: const Center(child: Text('Page 2')),
            ),
            Container(
              color: Colors.green,
              child: const Center(child: Text('Page 3')),
            ),

          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(onPressed: (){controller.jumpToPage(2);}, child: const Text('SKIP')),
            Center(child: SmoothPageIndicator(
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
            )),
            TextButton(onPressed: (){controller.nextPage(duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);}, child: const Text('NEXT'))
          ],
        ),
      ),
    );
  }
}
