import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI APP ',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: 'BMI CALCULATOR'),
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
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";

  var bgColor = Colors.orange.shade100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: Container(
          // color: bgColor,
          decoration: BoxDecoration(
            gradient: RadialGradient(
                colors: [
                  // Colors.orange.shade100,
                  // Colors.purple.shade100,
                  // Colors.brown.shade100,
                  Color(0xff667eea),
                  Color(0xfffa709a)
                ],
                center: Alignment.centerLeft,
                stops: [0.0, 1.0]),
          ),
          child: Center(
            child: Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "BMI",
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  TextField(
                    controller: wtController,
                    decoration: InputDecoration(
                        label: Text('Enter your weight in Kgs'),
                        prefixIcon: Icon(Icons.line_weight)),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 21,
                  ),
                  TextField(
                    controller: ftController,
                    decoration: InputDecoration(
                        label: Text('Enter your heights in Feet'),
                        prefixIcon: Icon(Icons.height)),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 21,
                  ),
                  TextField(
                    controller: inController,
                    decoration: InputDecoration(
                      label: Text('Enter your heights in Inch'),
                      prefixIcon: Icon(Icons.height),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 21,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        var wt = wtController.text.toString();
                        var ft = ftController.text.toString();
                        var inch = inController.text.toString();

                        if (wt != "" && ft != "" && inch != "") {
                          //BMI CALCULATION

                          var iWt = int.parse(wt);
                          var ift = int.parse(ft);
                          var iInch = int.parse(inch);

                          var tInch = (ift * 12) + iInch;

                          var tCm = tInch * 2.54;

                          var tM = tCm / 100;

                          var bmi = iWt / (tM * tM);

                          var msg = "";

                          if (bmi > 25) {
                            msg = "You are Over Weight!!";
                            bgColor = Colors.orange.shade200;
                          } else if (bmi < 18) {
                            msg = "You are Under Weight!!";
                            bgColor = Colors.red.shade200;
                          } else {
                            msg = "You are Perfect";
                            bgColor = Colors.green.shade200;
                          }

                          setState(() {
                            result =
                                " $msg \n Your BMI is: ${bmi.toStringAsFixed(4)}";
                          });
                        } else {
                          setState(() {
                            result = "Please fill all the required blanks!!";
                          });
                        }
                      },
                      child: Text("Calculate")),
                  SizedBox(
                    height: 11,
                  ),
                  Text(
                    result,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
