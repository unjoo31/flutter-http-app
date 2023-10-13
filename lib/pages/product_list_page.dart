import 'package:flutter/material.dart';
import 'package:flutter_http_app/model/product.dart';
import 'package:flutter_http_app/repository/product_repository.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Product>(
        future: ProductRepository().fetchProduct(1),
        builder: (context, snapshot) {
          print("그림 그려짐");
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            Product product = snapshot.data!;
            return ListView.builder(
              itemCount: 1, // 단일 항목이므로 itemCount는 1로 설정
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text("${product.id}"),
                  title: Text("${product.name}"),
                  subtitle: Text("${product.price}"),
                );
              },
            );
          }
        },
      ),
    );
  }
}
