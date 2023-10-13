import 'package:flutter/material.dart';
import 'package:flutter_http_app/model/user.dart';
import 'package:flutter_http_app/repository/user_repository.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<User>>(
        future: UserRepository().fetchUserList(),
        builder: (context, snapshot) {
          print("그림그려짐");
          if (snapshot.hasData) {
            // 통신이 끝남
            List<User> userList =
                snapshot.data ?? []; // 통신이 끝났어도 데이터가 없으면 null일 수 있다
            return ListView.builder(
              itemCount: userList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text("${userList[index].id}"),
                  title: Text("${userList[index].username}"),
                  subtitle: Text("${userList[index].email}"),
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
