// Service untuk load data coffee shop dari dummy JSON
import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/coffee_shop.dart';

class CoffeeShopService {
  Future<List<CoffeeShop>> fetchCoffeeShops() async {
    final String response = await rootBundle.loadString(
      'lib/services/dummy_coffee_shops.json',
    );
    final List<dynamic> data = json.decode(response);
    return data.map((json) => CoffeeShop.fromJson(json)).toList();
  }
}
