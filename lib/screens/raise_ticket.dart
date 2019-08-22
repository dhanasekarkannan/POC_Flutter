import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/main_drawer.dart';

class RaiseTicket extends StatefulWidget {
  @override
  _RaiseTicketState createState() => _RaiseTicketState();
}

class _RaiseTicketState extends State<RaiseTicket> {
  bool _isSingleDay = true;
  var toDateCotroller = TextEditingController();
  var fromDateController = TextEditingController();

  Future<void> _selectToDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        toDateCotroller.text = DateFormat('dd-MM-yyyy').format(picked);
      });
    }
  }

  Future<void> _selectFromDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        fromDateController.text = DateFormat('dd-MM-yyyy').format(picked);
      });
    }
  }

  void _onCheckboxClicked(bool value) {
    setState(() {
      _isSingleDay = value;
      toDateCotroller.text = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('RAISE TICKET'),
        ),
        drawer: MainDrawer(),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              CheckboxListTile(
                onChanged: (v) => _onCheckboxClicked(v),
                value: _isSingleDay,
                controlAffinity: ListTileControlAffinity.platform,
                title: Text('Single Day'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Reason'),
              ),
              TextField(
                onTap: () {
                  _selectFromDate(context);
                },
                decoration: InputDecoration(
                  labelText: _isSingleDay ? 'Date' : 'From',
                ),
                controller: toDateCotroller,
                enabled: !_isSingleDay,
              ),
              TextField(
                decoration: InputDecoration(enabled : false , labelText: 'To'),
                controller: toDateCotroller,
                enabled: !_isSingleDay,
                onTap: () {
                    
                  _selectToDate(context);
                },
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: 'Description', alignLabelWithHint: true),
                maxLines: 3,
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Theme.of(context).primaryColor,
                  onPressed: () {}),
            ],
          ),
        ));
  }
}
