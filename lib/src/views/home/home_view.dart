import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:s_shop_lao/src/services/theme_service.dart';
import 'package:s_shop_lao/src/viewmodels/poster_view_model.dart';
import 'package:s_shop_lao/src/views/home/widgets/category_list_view.dart';
import 'package:s_shop_lao/src/views/home/widgets/poster_list_view.dart';
import 'package:s_shop_lao/src/views/menu/widgets/menu_hort_card.dart';
import '../../../themes/component/hide_keyboard.dart';
import '../../../themes/component/input_field.dart';
import '../../services/category_service.dart';
import '../../services/navigation_service.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch menuItems when the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<PosterViewModel>(context, listen: false).fetchPosters();
    });
    final navigationProvider = Provider.of<NavigationService>(context);
    return HideKeyboard(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                context.color.primary,
                context.color.primary,
                context.color.surface,
                context.color.surface,
                context.color.surface,
              ],
            ),
          ),
          child: NestedScrollView(
            scrollBehavior: const ScrollBehavior()
                .copyWith(physics: const BouncingScrollPhysics()),
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                backgroundColor: context.color.primary,
                title: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => navigationProvider.setIndex(2),
                          child: const InputField(
                            isActive: false,
                            icon: 'Search',
                            hint: 'Search Your Food',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                expandedHeight: 190,
                floating: true,
                pinned: true,
                flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final double currentHeight = constraints.biggest.height;

                    final double opacity = ((currentHeight - kToolbarHeight) /
                            (170 - kToolbarHeight))
                        .clamp(0.0, 1.0);

                    return FlexibleSpaceBar(
                      background: Image.asset(
                        'assets/images/appbar-bg.png',
                        fit: BoxFit.cover,
                      ),
                      collapseMode: CollapseMode.pin,
                      title: opacity > 0.5
                          ? Opacity(
                              opacity: opacity,
                              child: Text("We have all \nyour need in here",
                                  style: context.typo.headline3.copyWith(
                                    color: context.color.onPrimary,
                                  )),
                            )
                          : null, // No widget when opacity is 0
                      titlePadding: const EdgeInsets.all(16),
                    );
                  },
                ),
              ),
            ],
            body: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: context.color.surface,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const SizedBox(height: 100, child: CategoryListView()),
                      const SizedBox(height: 10),
                      Text("Interesting", style: context.typo.headline2),
                      // const Divider(),
                      const PosterListView(),
                      // Text("Must try!!", style: context.typo.headline2),
                      // const SizedBox(height: 10),
                      // Text("New Arrivals", style: context.typo.headline2),
                      // const SizedBox(height: 10),
                      Text("Best Customers Choices",
                          style: context.typo.headline2),
                      Consumer<CategoryService>(
                        builder: (context, viewModel, child) {
                          if (viewModel.isBusy) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (viewModel.menuItems.isEmpty) {
                            return const Center(
                                child: Text('No posters available.'));
                          } else {
                            // Ensure the ListView has a defined height
                            return SizedBox(
                              height:
                                  200, // Set a fixed height for the ListView
                              child: ListView.separated(
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  width: 20,
                                  height: 10,
                                ),
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                itemCount: viewModel.menuItems.length,
                                itemBuilder: (context, index) {
                                  var menuItem = viewModel.menuItems[index];
                                  return SizedBox(
                                    width: 200,
                                    child: MenuHortCard(menuItem: menuItem),
                                  );
                                },
                              ),
                            );
                          }
                        },
                      ),

                      Text("New Arrivals", style: context.typo.headline2),
                      Consumer<CategoryService>(
                        builder: (context, viewModel, child) {
                          if (viewModel.isBusy) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (viewModel.menuItems.isEmpty) {
                            return const Center(
                                child: Text('No posters available.'));
                          } else {
                            // Ensure the ListView has a defined height
                            return SizedBox(
                              height:
                                  200, // Set a fixed height for the ListView
                              child: ListView.separated(
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  width: 20,
                                  height: 10,
                                ),
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                itemCount: viewModel.menuItems.length,
                                itemBuilder: (context, index) {
                                  var menuItem = viewModel.menuItems[index];
                                  return SizedBox(
                                    width: 200,
                                    child: MenuHortCard(menuItem: menuItem),
                                  );
                                },
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
