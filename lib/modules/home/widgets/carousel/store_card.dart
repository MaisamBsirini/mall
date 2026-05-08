import 'package:flutter/material.dart';
import 'package:mall/data/models/store_model.dart';
import 'active_store_card.dart';
import 'inactive_store_card.dart';

class StoreCard extends StatelessWidget {
  final StoreModel store;
  final bool isActive;

  const StoreCard({
    super.key,
    required this.store,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    if (isActive) {
      return ActiveStoreCard(store: store);
    }

    return InactiveStoreCard(store: store);
  }
}