import 'package:flutter/material.dart';
import '../models/service.dart';

class FavoritesProvider extends ChangeNotifier {
  final List<Service> _favorites = [];

  List<Service> get favorites => List.unmodifiable(_favorites);

  bool isFavorite(Service service) {
    return _favorites.any((item) => item.id == service.id);
  }

  void toggleFavorite(Service service) {
    if (isFavorite(service)) {
      _favorites.removeWhere((item) => item.id == service.id);
    } else {
      _favorites.add(service);
    }

    notifyListeners();
  }
}