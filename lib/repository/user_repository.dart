import 'package:dio/dio.dart';
import 'package:flutter_http_app/model/user.dart';

final dio = Dio(BaseOptions(baseUrl: "http://192.168.0.13:8080"));

class UserRepository {
  Future<List<User>> fetchUserList() async {
    Response<dynamic> response = await dio.get("/user");
    print(response.data);

    // dio가 map을 list타입으로 변경해줌
    List<dynamic> bodyList = response.data as List<dynamic>;
    List<User> userList = bodyList.map((e) => User.fromJson(e)).toList();

    print(userList[0].username);

    return userList;
  }

  // 통신 테스트하기 (데이터 기다릴 때 Future박스라도 돌려주기 위해 Future를 붙여야함)
  Future<User> fetchUser(int id) async {
    Response<dynamic> response = await dio.get("/user/$id");
    print(response.data);

    // 다운캐스팅
    Map<String, dynamic> body = response.data as Map<String, dynamic>;
    print(body["username"]);

    // 오브젝트 만들기
    User user = User.fromJson(body);
    return user;
  }
}
