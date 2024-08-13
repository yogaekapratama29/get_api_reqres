import 'package:flutter/material.dart';
import 'package:rest_api/models/user.dart';
import 'package:rest_api/services/user_service.dart';

class HomepageStateless extends StatelessWidget {
  const HomepageStateless({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get API Future Builder"),
      ),
      body: FutureBuilder<List<User>>(
          // kita sudah memanggil parameter dari future nya maka widget builder akan dipanggil
          // ketika data sudah ready maka builder akan di panggil
          future: UserService.fetchUser(),
          builder: (context, snapshot) {
            final users = snapshot.data;
            // waiting
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            // hasData
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: users!.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(user.avatar),
                      ),
                      title: Text("${user.firstName},${user.lastName}"),
                      subtitle: Text(user.email),
                    ),
                  );
                },
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text("Error"),
              );
            }
            // jika snapshot nya tidak waiting dan tidak hasData maka return container kosong
            return Container();
          }),
    );
  }
}
