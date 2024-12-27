import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:s_shop_lao/src/models/poster.dart';
import '../repository/poster_reposity.dart';

class PosterViewModel extends ChangeNotifier {
  final PosterRepository _posterRepository = PosterRepository();
  List<Poster> _posters = [];
  bool _isLoading = false;

  List<Poster> get posters => _posters;
  bool get isLoading => _isLoading;

  Future<void> fetchPosters() async {
    _isLoading = true;
    notifyListeners();

    try {
      _posters = await _posterRepository.fetchPosters();
    } catch (e) {
      log('Failed to fetch posters: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
