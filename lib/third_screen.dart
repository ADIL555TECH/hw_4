import 'package:flutter/material.dart';
import 'package:hw_4/local_db_screen.dart';
import 'package:hw_4/user_list_screen.dart';

class ThirdScreen extends StatefulWidget {
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  late LocalDatabase localDatabase;
  List<User> usersFromDB = [];

  @override
  void initState() {
    super.initState();
    localDatabase = LocalDatabase();
    getUsersFromDB();
  }

  Future<void> getUsersFromDB() async {
    final db = await localDatabase.database;
    final List<Map<String, dynamic>> usersMapList = await db!.query('users');
    setState(() {
      usersFromDB = usersMapList.map((e) => User.fromMap(e)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Screen'),
      ),
      body: ListView.builder(
        itemCount: usersFromDB.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(usersFromDB[index].fullName),
            subtitle: Text(usersFromDB[index].email),
          );
        },
      ),
    );
  }
}