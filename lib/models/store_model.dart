import 'package:cama_mod/repositories/shop.repo.dart';
import 'package:cama_mod/views/models/Item/item.dart';
import 'package:cama_mod/views/models/api_response/api_response.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import '../config/http_client.dart';

class StoreModel extends ChangeNotifier {
  final ShopRepo shopRepo;

  StoreModel({required this.shopRepo});

  bool _isLoading = false;
  List<Item> _items = [];
  Item? _selectedItem;
  String? _activeImage;

  bool get isLoading => _isLoading;
  List<Item> get items => _items;
  Item? get selectedItem => _selectedItem;
  String? get activeImage => _activeImage;

  void setSelectedItem(Item item) {
    _selectedItem = item;
    setActiveImage(item.images[0]);
    notifyListeners();
  }

  void setActiveImage(String imageUrl) {
    _activeImage = imageUrl;
    notifyListeners();
  }

  Future getShopItems() async {
    _isLoading = true;

    try {
      _items = await shopRepo.getShopItems();
      _isLoading = false;

      notifyListeners();
    } on Exception catch (e) {
      _isLoading = false;
      notifyListeners();

      developer.log(e.toString());
    }
  }
}
