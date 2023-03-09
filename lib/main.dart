import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/football_players.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<footballPlayer> listFootballPlayers = [];

  void addPlayers() {
    listFootballPlayers
        .add(footballPlayer(name: 'lionel messi', club: 'psg', age: 33));
    listFootballPlayers
        .add(footballPlayer(name: 'neymar', club: 'psg', age: 29));
    listFootballPlayers
        .add(footballPlayer(name: 'cr', club: 'juventus', age: 36));
    listFootballPlayers
        .add(footballPlayer(name: 'lugano', club: 'fb', age: 40));
  }

  void initState() {
    super.initState();
    addPlayers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView.builder(
            itemCount: listFootballPlayers.length,
            itemBuilder: (context, index) {
              return Card(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: Stack(
                    children: [
                      Text(
                        listFootballPlayers[index].name,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Positioned(
                          right: 0,
                          child: PopupMenuButton(
                            onSelected: (value) {},
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                value: 1,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(5),
                                      child: Icon(Icons.edit),
                                    ),
                                    Text('data'),
                                  ],
                                ),
                              ),
                              PopupMenuItem(
                                value: 2,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(5),
                                      child: Icon(Icons.share),
                                    ),
                                    Text('share'),
                                  ],
                                ),
                              ),
                              PopupMenuItem(
                                value: 3,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(5),
                                      child: Icon(Icons.delete),
                                    ),
                                    Text('delete'),
                                  ],
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              );
            }));
  }
}
