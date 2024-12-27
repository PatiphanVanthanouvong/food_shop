import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:s_shop_lao/src/viewmodels/poster_view_model.dart';

class PosterListView extends StatelessWidget {
  const PosterListView({super.key});

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
                var poster = viewModel.posters[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: SizedBox(
                      width: 150,
                      child: Image.network(
                        poster.imageUrl ?? '',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.error,
                            color: Colors.red,
                          );
                        },
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
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
