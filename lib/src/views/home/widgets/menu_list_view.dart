import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:s_shop_lao/src/viewmodels/poster_view_model.dart';

class MenuListView extends StatelessWidget {
  const MenuListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PosterViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (viewModel.posters.isEmpty) {
          return const Center(child: Text('No posters available.'));
        } else {
          return SizedBox(
            height: 200, // Provide a specific height constraint
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: viewModel.posters.length,
              itemBuilder: (context, index) {
                var menuItem = viewModel.posters[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: SizedBox(
                      child: AspectRatio(
                        aspectRatio: 3 / 1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            menuItem.imageUrl!,
                            // width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
