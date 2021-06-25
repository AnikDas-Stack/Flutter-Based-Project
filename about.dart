import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

List<Note> listData = [];

class about extends StatelessWidget {
  Future<bool> getInfo() async {
    var response = await http.get("https://jsonplaceholder.typicode.com/todos");
    var jsonData = json.decode(response.body);

    List<Note> notes = (jsonData as List).map((data) => new Note.maker(data)).toList();
    listData = List.from(notes);

      if(notes.length != null){
        return true;
      }
      else{
        return false;
      }
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> res = getInfo();
    return Scaffold
      (
        backgroundColor: Colors.blueGrey,

        body: ListView.builder(
          itemCount: listData.length,
          itemBuilder: (BuildContext context, int index){
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("User ID: " + listData[index].userId, style: TextStyle(color: Colors.black, fontSize: 16.0)),
                    Text("ID: " + listData[index].id, style: TextStyle(color: Colors.black, fontSize: 16.0)),
                    Text("Title: " + listData[index].title, style: TextStyle(color: Colors.black, fontSize: 16.0)),
                    Text("Completed: " + listData[index].completed, style: TextStyle(color: Colors.black, fontSize: 16.0))
                  ],
                ),
              ),
            );
          },
        ),

        appBar: AppBar(
            title: Text('ListView of JSON Data using API',
              style: TextStyle(color: Colors.white, fontSize: 20.0),),
            centerTitle: true,
            backgroundColor: Colors.black12
        )
    );
  }
}


class Note{
  final String userId, id, title, completed;
  Note({
  required this.userId,
  required this.id,
  required this.title,
  required this.completed,
  });

  factory Note.maker(Map<String, dynamic> json){
    return Note(
      userId: json['userId'].toString(),
      id: json['id'].toString(),
      title: json['title'].toString(),
      completed: json['completed'].toString(),
    );
  }
}

