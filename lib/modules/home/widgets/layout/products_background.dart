import 'package:flutter/material.dart';

class ProductsBackground
    extends StatelessWidget {
  const ProductsBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,

          colors: [
            Color(0xFFF9F6F4),
            Color(0xFFF4ECE7),
            Color(0xFFF8F5F3),
          ],
        ),
      ),
    );
  }
}