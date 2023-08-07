// package imports
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

// screen imports
import 'login_screen.dart';
import 'registration_screen.dart';

// component imports
import '../components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 1), // 1 second
      vsync: this, // this is the ticker
    );

    animation = ColorTween(
        begin: Colors.blueGrey, end: Colors.white
    ).animate(controller);

    controller.forward(); // start the animation

    controller.addListener(() {
      setState(() {
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose(); // dispose the controller
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 60.0,
                    child: Image.asset('images/logo.png'), // this is the value of the animation
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: const ['Flash Chat'],
                  textStyle: const TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                  speed: const Duration(milliseconds: 300),
                )
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            // Login button
            RoundedButton(
              colour: Colors.lightBlueAccent,
              title: 'Log In',
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            // Register button
            RoundedButton(
              colour: Colors.blueAccent,
              title: 'Register',
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
