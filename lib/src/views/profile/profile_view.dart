import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:s_shop_lao/src/services/theme_service.dart';
import 'package:s_shop_lao/src/views/authentication/auth_viewmodel.dart';
import 'package:s_shop_lao/src/views/authentication/login/login_screen.dart';
import 'package:s_shop_lao/src/views/home/home_screen.dart';
import 'package:s_shop_lao/themes/component/button/button.dart';
import 'package:s_shop_lao/themes/component/cart_button.dart';
import 'package:s_shop_lao/themes/component/tile.dart';

import 'edit_profile_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthViewModel>();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Account',
          style: context.typo.headline3.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          const CartButton(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 320,
            width: double.infinity,
            decoration: BoxDecoration(
              color: context.color.hint.withOpacity(0.45),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  if (auth.currentUser != null) ...[
                    Text(
                      auth.currentUser!.email,
                      style: context.typo.headline3.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      auth.currentUser!.name,
                      style: context.typo.headline5.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                  const SizedBox(height: 10),
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(8.0),
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 2,
                      ),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        final icons = [
                          Icons.feed_outlined,
                          Icons.light_mode,
                          Icons.payment_outlined,
                          Icons.verified_user_outlined,
                        ];
                        final titles = [
                          'Orders',
                          'Light Mode',
                          'Payment',
                          'View profile',
                        ];
                        return GestureDetector(
                          onTap: () {
                            if (titles[index] == 'View profile') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const EditProfileView()),
                              );
                            }
                            if (titles[index] == 'Light Mode') {
                              context.read<ThemeService>().toggleTheme();
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: context.color.surface,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  icons[index],
                                  size: 30,
                                  color: context.color.primary,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  titles[index],
                                  style: context.typo.subtitle1,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: Button(
                onPressed: () {
                  auth.logout();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                  );
                },
                text: 'Logout',
                size: ButtonSize.large,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
