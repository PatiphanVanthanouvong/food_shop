import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:s_shop_lao/src/services/theme_service.dart';
import 'package:s_shop_lao/src/views/onboarding/onboard_view.dart';
import 'package:s_shop_lao/themes/component/button/button.dart';

class GetStartView extends StatelessWidget {
  const GetStartView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.primary,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            child: Image.asset(
              'assets/images/start-bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 100,
            left: 20,
            child: SizedBox(
              child: Column(
                children: [
                  Text(
                    'Every Absolutly\n Favorite Food\n  In One Place',
                    style: GoogleFonts.poppins(
                        color: context.color.onPrimary,
                        fontSize: 36,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Button(
              width: double.infinity,
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const OnboardView()),
                );
              },
              text: "Get Started",
              size: ButtonSize.large,
              backgroundColor: context.color.onPrimary,
              color: context.color.primary,
            ),
          )
        ],
      ),
    );
  }
}
