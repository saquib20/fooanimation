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
      title: 'ScrollView Animation',
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: ClipAnimation(),
    );
  }
}

class ClipAnimation extends StatefulWidget {
  const ClipAnimation({super.key});

  @override
  State<ClipAnimation> createState() => _ClipAnimationState();
}

class _ClipAnimationState extends State<ClipAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ClipRReact Animation"),
        centerTitle: true,
      ),
      body: Center(
          child: ClipRRect(
              borderRadius: BorderRadius.circular(21),
              child: Image.network(
                "https://sportshub.cbsistatic.com/i/2022/02/18/c1fba9b9-cc44-4aba-a877-0a509d3c8d11/demon-slayer-doma.jpg",
                width: 400,
                height: 200,
                fit: BoxFit.fill,
              ))),
    );
  }
}
