import 'package:flutter/material.dart';
import 'package:rest_api/models/user.dart';
import 'package:rest_api/services/user_service.dart';

class HomePageStatefull extends StatefulWidget {
  const HomePageStatefull({super.key});

  @override
  State<HomePageStatefull> createState() => _HomePageStatefullState();
}

class _HomePageStatefullState extends State<HomePageStatefull> {
  List<User> users = [];
  // membuat loading
  bool isLoading = true;

  void fetchUser() async {
    // ubah untuk isLoading tidak selalu True
    isLoading = true;
    final result = await UserService.fetchUser();
    users = result;
   // setState untuk memanggil ulang data dari users ke result
    setState(() {});
   // jika data sudah dipanggil oleh setState maka
    isLoading = false;
  }

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get API Statefull"),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: users.length,
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
            ),
    );
  }
}
