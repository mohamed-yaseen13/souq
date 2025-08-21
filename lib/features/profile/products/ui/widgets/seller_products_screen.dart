import 'package:flutter/material.dart';
import 'package:souq/core/widgets/app_screen_template.dart';

class SellerProductsScreen extends StatelessWidget {
  const SellerProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreenTemplate(child: Center(child: Text('Products')));
  }
}
