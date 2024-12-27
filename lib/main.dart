import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:s_shop_lao/src/services/category_service.dart';
import 'package:s_shop_lao/src/services/navigation_service.dart';
import 'package:s_shop_lao/src/viewmodels/search_view_model.dart';
import 'package:s_shop_lao/src/views/authentication/login/login_screen.dart';
import 'package:s_shop_lao/src/views/home/home_screen.dart';
import 'package:s_shop_lao/src/views/onboarding/get_start_view.dart';

import 'src/services/cart_service.dart';
import 'src/services/theme_service.dart';
import 'src/viewmodels/poster_view_model.dart';
import 'src/views/authentication/auth_viewmodel.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DefaultCacheManager();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => ThemeService(),
    ),
    ChangeNotifierProvider(
      create: (context) => AuthViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => PosterViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => NavigationService(),
    ),
    ChangeNotifierProvider(
      create: (context) => SearchViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => CartService(),
    ),
    ChangeNotifierProvider(
      create: (context) => CategoryService(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final isUserLoggedIn = context.watch<AuthViewModel>().isLoggedIn();

    return MaterialApp(
      builder: (context, child) {
        return Overlay(
          initialEntries: [
            OverlayEntry(builder: (context) => child!),
          ],
        );
      },
      theme: context.themeService.themeData,
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: isUserLoggedIn ? const HomeScreen() : const GetStartView(),
    );
  }
}
