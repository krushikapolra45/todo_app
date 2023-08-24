import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/view/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    fadeInAnimation();
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
    });
  }

  bool isAnimate = false;
  AnimationController? controller;
  Animation<double>? animation;

  fadeInAnimation() {
    controller = AnimationController(duration: Duration(milliseconds: 2000), vsync: this);
    animation = CurvedAnimation(parent: controller!, curve: Curves.easeIn);
    Future.delayed(Duration(milliseconds: 400), () => controller!.forward());
  }

  iconAnimation() => Future.delayed(Duration(milliseconds: 100), () => isAnimate = true);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    EdgeInsets devicePadding = MediaQuery.of(context).viewPadding;
    return Padding(
      padding: devicePadding,
      child: Scaffold(
          body: Container(
        width: screenWidth,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.deepPurple.shade50],
            // begin: Alignment.topRight,
            // end: Alignment.bottomLeft,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/todo.png",
              width: screenWidth / 2,
              height: screenHeight / 5,
            ),
            FadeTransition(
              opacity: animation!,
              child: Text(
                "welcome To Do App",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
