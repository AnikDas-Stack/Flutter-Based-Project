import 'package:flutter/material.dart';
import 'home.dart';
import 'about.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: Scaffold(
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget
{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      drawer: Drawer(
        child: ListView(
            children: <Widget>[
              DrawerHeader(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: <Color>[
                        Colors.blueGrey,
                        Colors.blueGrey
                      ])
                  ),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Material(
                          child: Image.asset('images/mechanic_koi.jpg', width: 100, height: 100),
                        ),
                        Padding(padding: EdgeInsets.all(8.0),
                          child: Text('Mechanic Koi',
                            style: TextStyle(color: Colors.white, fontSize: 15.0),),)
                      ],
                    ),
                  )
              ),
              CustomListTile(Icons.home, 'Home'),
              CustomListTile(Icons.description, 'About'),
            ]
        ),
      ),
      appBar: AppBar(
          title: Text("MechaBot"),
          centerTitle: true,
          backgroundColor: Colors.blueGrey
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Material(
                  child: Image.asset('images/mechanic_koi.jpg', width: 600, height: 200)
              ),
              Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'MechaBot is a virtual assistant provided by Mechanic Koi company. '+
                        'It is an AI based chatbot which can provide real time authentic information. '+
                        'If you have any quries then please write down here. MechaBot is ready to reply you..!!',
                    style: TextStyle(color: Colors.white, fontSize: 14.0),)
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  IconData icon;
  String text;

  CustomListTile(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.blueGrey.shade400))
        ),
        child: InkWell(
          splashColor: Colors.blueGrey,
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(icon),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(text, style: TextStyle(
                          fontSize: 16.0
                      ),),
                    ),
                  ],
                ),
                Icon(Icons.arrow_right),
              ],
            ),
          ),
          onTap: () {
            if (text == 'Home'){
              Navigator.push(context, MaterialPageRoute(builder: (context) => home()));
            }
            if (text == 'About'){
              Navigator.push(context, MaterialPageRoute(builder: (context) => about()));
            }
          },
        ),
      ),
    );
  }
}
