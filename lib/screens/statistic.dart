import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class Statistics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: MainDrawer(),
    );
  }
}
