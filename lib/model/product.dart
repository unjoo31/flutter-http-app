// Model -> 서버로 부터 받을 데이터 타입을 정의 (서버측 테이블과 동일하게 만들면됨)
class Product {
  int? id;
  String? name;
  String? price;

  Product({this.id, this.name, this.price});

  // 통신으로 데이터 받을 때(Map -> Object)
  Product.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    price = json["price"];
  }

  // 통신으로 데이터 보낼 때(Object -> Map)
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "price": price,
    };
  }
}
