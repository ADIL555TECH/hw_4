import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hw_4/local_db_screen.dart';
import 'package:hw_4/user_list_screen.dart';
import 'package:hw_4/third_screen.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:convert';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  List<User> users = [];
  late LocalDatabase localDatabase;
  late Database? _database;

  @override
  void initState() {
    super.initState();
    localDatabase = LocalDatabase();
    openDatabase();
    fetchInitialUsers();
  }

  Future<void> openDatabase() async {
    _database = await localDatabase.database;
  }

  Future<void> fetchInitialUsers() async {
    final response =
    await http.get(Uri.parse('https://randomuser.me/api/?results=10'));
    if (response.statusCode == 200) {
      setState(() {
        users = parseUsers(response.body);
        users.forEach((user) {
          storeSelectedUser(user);
        });
      });
    }
  }

  List<User> parseUsers(String responseBody) {
    final parsed = json.decode(responseBody)['results'] as List<dynamic>;
    List<User> users = parsed
        .map((user) => User(
      fullName: '${user['name']['first']} ${user['name']['last']}',
      email: user['email'],
      phoneNumber: user['phone'],
    ))
        .toList();
    return users;
  }

  Future<void> storeSelectedUser(User user) async {
    if (_database != null) {
      await _database!.insert('users', user.toMap());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(users[index].fullName),
            subtitle: Text(users[index].email),
            trailing: IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                storeSelectedUser(users[index]);
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThirdScreen()),
                );
              },
              child: Text('Third Screen'),
            ),
          ],
        ),
      ),
    );
  }
}