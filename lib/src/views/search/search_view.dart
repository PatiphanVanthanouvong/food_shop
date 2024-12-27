import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:s_shop_lao/src/viewmodels/search_view_model.dart';
import 'package:s_shop_lao/src/views/menu/widgets/menu_grid.dart';
import '../../../themes/component/button/button.dart';
import '../../../themes/component/hide_keyboard.dart';
import '../../../themes/component/input_field.dart';
import '../menu/widgets/menu_card.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final SearchViewModel searchViewModel = SearchViewModel();

  @override
  void initState() {
    super.initState();
    // context.read<SearchViewModel>().loadCategories();
    searchViewModel.searchProductList();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => searchViewModel,
      child: Consumer<SearchViewModel>(
        builder: (context, viewModel, child) => HideKeyboard(
          child: Scaffold(
            appBar: AppBar(
              title: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: InputField(
                        icon: 'Search',
                        controller: viewModel.textController,
                        onClear: viewModel.searchProductList,
                        onSubmitted: (text) => viewModel.searchProductList(),
                        hint: 'Search Your Food',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: viewModel.isBusy
                      ? const Center(child: CircularProgressIndicator())
                      : viewModel.menuItems.isEmpty
                          ? const Center(child: Text('No menu items found.'))
                          : MenuGrid(viewModel.menuItems),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
