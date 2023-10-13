import 'package:dio/dio.dart';
import 'package:flutter_http_app/model/product.dart';

// 본인의 ip를 기본적으로 세팅하기
final dio = Dio(BaseOptions(baseUrl: "http://192.168.0.13:8080"));

class ProductRepository {
  // 데이터 기다릴 때 Future박스라도 돌려주기 위해 Future를 붙여야함
  Future<List<Product>> fetchProductList() async {
    // <dynamic>을 사용하는 이유는 서버에서 다양한 dto가 넘어 오기 때문임
    Response<dynamic> response = await dio.get("/product");
    print(response.data);

    // dio가 map을 list타입으로 변경해줌
    List<dynamic> bodyList = response.data as List<dynamic>;
    List<Product> productList =
        bodyList.map((e) => Product.fromJson(e)).toList();

    print(productList[0].name);

    return productList;
  }

  // 데이터 기다릴 때 Future박스라도 돌려주기 위해 Future를 붙여야함
  Future<Product> fetchProduct(int id) async {
    Response<dynamic> response = await dio.get("/product/$id");
    print(response.data);

    // 다운캐스팅(Map을 꺼내쓸 수 있지만 불편하기 때문에 하는 행위)
    Map<String, dynamic> body = response.data as Map<String, dynamic>;
    print(body["name"]);

    // 오브젝트 만들기
    Product product = Product.fromJson(body);
    return product;
  }
}
