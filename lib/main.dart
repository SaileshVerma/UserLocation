import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var location = "";
  void getcurrentLocation() async {
    final pos = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(pos.latitude);
    print(pos.longitude);

    setState(() {
      location = pos.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location finder"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("PRESS ON THE ICON"),
            Center(
              child: IconButton(
                  icon: Icon(
                    Icons.location_on,
                    size: 47,
                  ),
                  onPressed: () {
                    getcurrentLocation();
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Your location coordinates will be displayed here :"),
            SizedBox(
              height: 20,
            ),
            Text(
              location,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
