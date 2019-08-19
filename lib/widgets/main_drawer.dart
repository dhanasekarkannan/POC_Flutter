import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: Icon(
              Icons.account_circle,
              size: 150,
              color: Colors.white,
            ),
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.infinity,
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Check-In'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/locationInput');
            },
          ),
          ListTile(
            leading: Icon(Icons.insert_chart),
            title: Text('Stats'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/statistics');
            },
          ),
          ListTile(
            leading: Icon(Icons.mail_outline),
            title: Text('Raise Ticket'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/raiseTicket');
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
        ],
      ),
    );
  }
}
