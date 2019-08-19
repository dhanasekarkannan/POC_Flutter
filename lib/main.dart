import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './screens/raise_ticket.dart';
import './screens/statistic.dart';
import './widgets/location_input.dart';

import './widgets/location_input.dart';
import './widgets/login.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.blue
      ),
      // home: MyHomePage(),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/login': (context) => Login(),
        '/locationInput': (context) => LocationInput(),
        '/statistics' : (context) => Statistics(),
        '/raiseTicket' : (context) => RaiseTicket(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Login(),
    );
  }
}
