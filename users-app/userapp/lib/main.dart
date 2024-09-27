import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map data;
  List usersData;
  getUsers() async {
    http.Response response =
        await http.get(Uri.parse('http://10.0.2.2:4000/api/Users'));
    data = json.decode(response.body);
    setState(() {
      usersData = data['Users'];
    });

    //consulta de donde obtengo los datos
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('User List'),
        ),
        body: ListView.builder(
          itemCount: usersData == null ? 0 : usersData.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('$index'),
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(usersData[index]['avatar']),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                        '${usersData[index]['firstName']}${usersData[index]['lastName']}'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
