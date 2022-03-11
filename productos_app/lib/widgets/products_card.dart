import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: const EdgeInsets.only(top:30, bottom: 50),
        width: double.infinity,
        decoration: _cardBorders(),
        height: 400,
      ),
    );
  }

  BoxDecoration _cardBorders() => const BoxDecoration(
    color: Colors.red,
    borderRadius: const BorderRadius.circular(20);
  );
}