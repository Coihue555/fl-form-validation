import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
     
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Container(
        decoration: _buildBoxDecoration(),

      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
    borderRadius: BorderRadius.only()
  );
}