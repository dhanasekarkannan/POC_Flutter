import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: Center(
            child: Container(
          margin: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    height: 220,
                    child: Card(
                      child: Image.asset(
                        'assets/images/hdfc-life-logo.jpg',
                      ),
                      elevation: 6,
                    )),
                    SizedBox(height: 10,),
                    Text( 'Welcome to HDFC Life Vendor Login', style: TextStyle(color: Colors.blue[600]),),
                TextField(
                  decoration: InputDecoration(labelText: 'Username'),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Password',),keyboardType: TextInputType.,
                ),
                RaisedButton( child: Text('Login'), color: Colors.red, textColor: Colors.white, onPressed: (){},),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      child: Text('Forgot Password?'),
                      textColor: Colors.blue,
                      onPressed: (){},
                    ),
                    FlatButton(
                      child: Text('Register'),
                      textColor: Colors.blue,
                      onPressed: (){},
                    )
                  ],
                )
              ],
            ),
          ),
        )));
  }
}
