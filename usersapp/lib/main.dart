import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main(){
  runApp(
    MaterialApp(
      home: HomePage()
    ),
  );
}

class HomePage extends StatefulWidget{
  @override 
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map data;
  List usersData;

  getUsers() async {
   http.Response response = await http.get('http://192.168.1.40:4000/api/users');
   data = json.decode(response.body);
   setState(() {
     usersData = data['users'];
   });
  }

  @override
  void initState(){
    super.initState();
    getUsers(); 
  }

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de usuarios'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: usersData == null ? 0 : usersData.length,
        itemBuilder: (BuildContext context, int index){
          return Card(
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  /*child: Text(
                    "$index", 
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500
                    ),
                  ),*/
                ),
                CircleAvatar(backgroundImage: NetworkImage(usersData[index]['avatar']),
                ),
                Padding(padding: const EdgeInsets.all(10.0),
                  child: Text("${usersData[index]["nombre"]} ${usersData[index]["apellido"]}",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400
                  ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}