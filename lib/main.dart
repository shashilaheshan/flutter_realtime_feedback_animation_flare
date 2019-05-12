import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
     theme: ThemeData.dark(),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String anim;
  double _sliderValue = 10.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Slider(
              activeColor: Colors.deepPurple,
              inactiveColor: Colors.blue,
              min: 0.0,
              max: 100.0,
              onChanged: (newRating) {
                setState(() {
                  if (newRating > 40 && newRating < 65) {
                    anim = "avg";
                  } else if (newRating > 65) {
                    anim = "good";
                  } else if (newRating < 40) {
                    anim = "bad";
                  }
                });
                setState(() => _sliderValue = newRating);
              },
              value: _sliderValue,
            ),
            Text("Value $_sliderValue"),
            Expanded(
              child: FlareActor(
                'assets/feedback.flr',
                alignment: Alignment.center,
                animation: anim,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
