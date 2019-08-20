import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionList;
  TransactionList(this.transactionList);

  // Widget transactionTiles = Card(
  //           child: Row(
  //             children: <Widget>[
  //               Container(
  //                 margin: EdgeInsets.all(10),
  //                 padding: EdgeInsets.all(5),
  //                 decoration: BoxDecoration(
  //                     border: Border.all(color: Theme.of(context).primaryColor, width: 2)),
  //                 child: Text(
  //                   '\$${transactionList[index].hours.toStringAsFixed(2)}',
  //                   textAlign: TextAlign.center,
  //                 ),
  //               ),
  //               Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: <Widget>[
  //                   Text(transactionList[index].id),
  //                   Text(
  //                     DateFormat('yyyy-MM-dd').format(transactionList[index].date),
  //                   ),
  //                 ],
  //               )
  //             ],
  //           ),
  //         );

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
                  child: Text(
                      '${transactionList[index].hours.toStringAsFixed(2)}'),
                ),
                title: Text('${DateFormat.EEEE().format(transactionList[index].date)}', style: TextStyle(fontWeight: FontWeight.w600),),
                subtitle: Text('${DateFormat('dd-MM-yyyy').format(transactionList[index].date)}',style: TextStyle(color: Theme.of(context).accentColor),),
                trailing: Icon(
                  Icons.access_alarms,
                )),
          );
        },
        itemCount: transactionList.length,
      ),
    );
  }
}
