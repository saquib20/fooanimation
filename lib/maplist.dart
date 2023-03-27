import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mapping List',
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MapList(),
    );
  }
}

class MapList extends StatefulWidget {
  const MapList({super.key});

  @override
  State<MapList> createState() => _MapList();
}

class _MapList extends State<MapList> {
  var arrData = [
    'saquib',
    'aditya',
    'sumit',
    'soham',
    'dhruv',
    'sarvesh',
    'bhanu',
    'osama',
    'falguni',
    'harsh',
    'hamza',
    'anisha'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Mapping List to Widgets"),
          centerTitle: true,
        ),
        body: Container(
          child: ListView(
              children: arrData.map((value) {
            return Center(
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(21)),
                color: Colors.blue.shade100,
                child: Text(
                  '$value',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            );
          }).toList()),
        ));
  }
}
