import 'package:flutter/material.dart';
import 'package:flutter_seminar/model/user.dart';
import 'package:flutter_seminar/provider/sql/sqf_testing.dart';

import 'widgets/action_dialog.dart';
import 'widgets/app_drawer.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  SqlTesting sqlTesting = SqlTesting();
  bool isLoading = false;

  Future<List<User>> getUsers() async {
    setState(() {
      isLoading = !isLoading;
    });
    return await sqlTesting.read().then((value) {
      setState(() {
        isLoading = !isLoading;
      });
      return value;
    }, onError: (error) {
      throw error;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        centerTitle: true,
      ),
      drawer: const AppDrawer(),
      body: FutureBuilder<List<User>>(
        future: getUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Card(
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      leading: CircleAvatar(
                        child: Text(users[index].fName![0]),
                      ),
                      title: Text("${users[index].fName!} ${users[index].mName!} ${users[index].lName!}"),
                      subtitle: Text(users[index].position!),
                      trailing: IconButton(
                        onPressed: (){
                          showDialog(
                            context: context, 
                            builder: (context) => ActionDialog(
                              user: users[index],
                              actionTesting: ActionTesting.edit
                            ),
                          );
                        }, 
                        icon: const Icon(Icons.edit)
                      )
                    ),
                  ),
                );
              },
            );
          } else if(snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context, 
            builder: (context) => const ActionDialog(actionTesting: ActionTesting.create),
          );
        },
      ),
    );
  }
}