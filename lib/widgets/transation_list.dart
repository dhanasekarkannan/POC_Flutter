import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionList;
  TransactionList(this.transactionList);
  void _showCheckingDetails(BuildContext ctx, Transaction txDetails) {
    showModalBottomSheet(
        context: ctx,
        builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.3,
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        CircleAvatar(
                          child: Icon(
                            Icons.touch_app,
                            size: 50,
                          ),
                          backgroundColor: Colors.green,
                          radius: 40,
                        ),
                        Text(
                          'Check-IN',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              color: Theme.of(context).accentColor),
                        ),
                        Text(
                          txDetails.timeIn,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 13,
                              color: Colors.pink),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        CircleAvatar(
                          child: Icon(
                            Icons.touch_app,
                            size: 50,
                          ),
                          radius: 40,
                        ),
                        Text(
                          'Check-OUT',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              color: Theme.of(context).accentColor),
                        ),
                        Text(
                          txDetails.timeOut,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 13,
                              color: Colors.pink),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                          DateFormat.MMMMEEEEd().format(txDetails.date),
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: Colors.red)
                              ,
                            
                        ),
              ],
            ),
            
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      margin: EdgeInsets.all(15),
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            elevation: 2,
            child: ListTile(
              leading: CircleAvatar(
                child:
                    Text('${transactionList[index].hours.toStringAsFixed(2)}'),
              ),
              title: Text(
                '${DateFormat.EEEE().format(transactionList[index].date)}',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                '${DateFormat('dd-MM-yyyy').format(transactionList[index].date)}',
                style: TextStyle(color: Theme.of(context).accentColor),
              ),
              trailing: Icon(
                Icons.access_alarms,
              ),
              onTap: () => _showCheckingDetails(ctx, transactionList[index]),
            ),
          );
        },
        itemCount: transactionList.length,
      ),
    );
  }
}
