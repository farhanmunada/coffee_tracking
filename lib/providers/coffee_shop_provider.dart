// Provider untuk state management coffee shop
import 'package:flutter/material.dart';
import '../models/coffee_shop.dart';
import '../services/coffee_shop_service.dart';

class CoffeeShopProvider extends ChangeNotifier {
  final CoffeeShopService _service = CoffeeShopService();
  List<CoffeeShop> _shops = [];
  bool _isLoading = false;

  List<CoffeeShop> get shops => _shops;
  bool get isLoading => _isLoading;

  Future<void> loadShops() async {
    _isLoading = true;
    notifyListeners();
    _shops = await _service.fetchCoffeeShops();
    debugPrint('Loaded shops: \\${_shops.length}');
    for (var shop in _shops) {
      debugPrint('Shop: \\${shop.name} (lat: \\${shop.lat}, lng: \\${shop.lng})');
    }
    _isLoading = false;
    notifyListeners();
  }
}
