import 'package:flutter/material.dart';
import 'package:flutter_http_app/model/product.dart';
import 'package:flutter_http_app/repository/product_repository.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Product>>(
        future: ProductRepository().fetchProductList(),
        builder: (context, snapshot) {
          print("그림그려짐");
          if (snapshot.hasData) {
            // 통신이 끝남
            List<Product> productList =
                snapshot.data ?? []; // 통신이 끝났어도 데이터가 없으면 null일 수 있다
            return ListView.builder(
              itemCount: productList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text("${productList[index].id}"),
                  title: Text("${productList[index].name}"),
                  subtitle: Text("${productList[index].price}"),
                );
              },
            );
          } else {
            // 통신중인 상태
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
