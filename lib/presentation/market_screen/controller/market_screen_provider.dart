import 'package:flutter/material.dart';

class MarketplaceProvider with ChangeNotifier {
  String _selectedCategory = "Digital Art";
  double _minPrice = 0;
  double _maxPrice = 10;

  String get selectedCategory => _selectedCategory;
  double get minPrice => _minPrice;
  double get maxPrice => _maxPrice;
  String selectedSort = 'low_to_high'; // Default value
  void selectCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void updatePriceRange(double min, double max) {
    _minPrice = min;
    _maxPrice = max;
    notifyListeners();
  }
   void setSort(String value) {
    selectedSort = value;
    notifyListeners();
  }

}
