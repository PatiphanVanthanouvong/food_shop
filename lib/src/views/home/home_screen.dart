import 'package:animations/animations.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:s_shop_lao/src/services/navigation_service.dart';
import 'package:s_shop_lao/src/services/theme_service.dart';
import 'package:s_shop_lao/src/views/cart/cart_view.dart';
import 'package:s_shop_lao/src/views/home/home_view.dart';
import 'package:s_shop_lao/src/views/search/search_view.dart';
import '../profile/profile_view.dart';
import '../../../themes/component/widget/page_wrapper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const List<Widget> screens = [
    HomeView(),
    CartView(),
    SearchView(),
    ProfileView()
  ];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final List<BottomNavyBarItem> bottomNavyBarItems = [
      BottomNavyBarItem(
        title: const Text('Home'),
        icon: const Icon(Icons.home),
        activeColor: const Color(0xFFFA4A0C),
        inactiveColor: Colors.grey,
      ),
      BottomNavyBarItem(
        title: const Text('Menu'),
        icon: const Icon(Icons.restaurant_menu),
        activeColor: const Color(0xFFFA4A0C),
        inactiveColor: Colors.grey,
      ),
      BottomNavyBarItem(
        title: const Text('Search'),
        icon: const Icon(Icons.search),
        activeColor: const Color(0xFFFA4A0C),
        inactiveColor: Colors.grey,
      ),
      BottomNavyBarItem(
        title: const Text('Profile'),
        icon: const Icon(Icons.person),
        activeColor: const Color(0xFFFA4A0C),
        inactiveColor: Colors.grey,
      ),
    ];

    final navigationProvider = Provider.of<NavigationService>(context);

    return PageWrapper(
      child: Scaffold(
        bottomNavigationBar: BottomNavyBar(
          backgroundColor: context.color.surface,
          itemCornerRadius: 10,
          selectedIndex: navigationProvider.currentIndex,
          items: bottomNavyBarItems
              .map(
                (item) => BottomNavyBarItem(
                  icon: item.icon,
                  title: item.title,
                  activeColor: context.color.primary,
                  // inactiveColor: context.color.onInactiveContainer,
                ),
              )
              .toList(),
          onItemSelected: (currentIndex) {
            navigationProvider.setIndex(currentIndex);
          },
        ),
        body: PageTransitionSwitcher(
          duration: const Duration(seconds: 1),
          transitionBuilder: (
            Widget child,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
          child: HomeScreen.screens[navigationProvider.currentIndex],
        ),
      ),
    );
  }
}
