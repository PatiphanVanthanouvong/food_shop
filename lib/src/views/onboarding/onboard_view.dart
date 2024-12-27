import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:s_shop_lao/src/services/theme_service.dart';
import 'package:s_shop_lao/src/views/authentication/login/login_screen.dart';

import '../../../themes/component/button/button.dart';

class OnboardView extends StatefulWidget {
  const OnboardView({super.key});

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {
  final _introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        baseBtnStyle: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(context.color.primary),
        ),
        key: _introKey,
        pages: [
          PageViewModel(
            title: 'Welcome to My App',
            body: 'Discover amazing features that will boost your hungry.',
            image: Image.asset("assets/images/start1.png"),
            decoration: PageDecoration(
              // pageColor: context.color.primary,
              titleTextStyle:
                  context.typo.headline4.copyWith(fontWeight: FontWeight.bold),
              bodyTextStyle:
                  context.typo.headline4.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          PageViewModel(
            title: 'Fast and Easy',
            body:
                'Enjoy a seamless experience with our user-friendly interface.',
            image: Image.asset("assets/images/profile_pic.png"),
            decoration: PageDecoration(
              titleTextStyle:
                  context.typo.headline4.copyWith(fontWeight: FontWeight.bold),
              bodyTextStyle:
                  context.typo.headline4.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ],
        onDone: () {
          // Navigate to another screen when the 'Done' button is pressed
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        },
        overrideNext: Button(
          onPressed: () {
            // Handle the custom 'Next' button action
            _introKey.currentState?.next();
          },
          text: "Next",
          size: ButtonSize.medium,
          backgroundColor: Colors.orange,
          color: Colors.white,
        ),
        overrideDone: Button(
          onPressed: () {
            // Handle the custom 'Done' button action
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          },
          text: "Get Started",
          size: ButtonSize.medium,
          backgroundColor: Colors.green,
          color: Colors.white,
        ),
        dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          color: Colors.grey,
          activeSize: Size(22.0, 10.0),
          activeColor: Colors.orange,
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
      ),
    );
  }
}
