import 'package:flutter/material.dart';
import 'package:flutter_http_app/pages/product_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductListPage(),
    );
  }
}
