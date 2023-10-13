import 'package:dio/dio.dart';

final dio = Dio();

void main() async {
  await getHttp(); // Future박스에 데이터가 채워지는 것을 기다린다
}

Future<void> getHttp() async {
  final response = await dio.get('https://dart.dev');
  // 실행결과를 기다려야하니까 Future박스를 돌려주고 아래 코드를 실행한다
  print("1");
  print(response.data);
  print("2");
}
