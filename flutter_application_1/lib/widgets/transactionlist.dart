import 'package:flutter/material.dart';
import '../class_folder/transaction.dart';
import 'package:intl/intl.dart';
import '../main.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  Function deletetx;

  TransactionList(this.transactions, this.deletetx);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          height: 500,
          child: transactions.isEmpty
              ? Column(
                  children: [
                    Text(
                      'No Transaction added yet!',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Container(
                        height: 200,
                        padding: const EdgeInsets.all(20),
                        child: Image.asset(
                          'images/waiting.png',
                          fit: BoxFit.cover,
                        )),
                  ],
                )
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 5),
                      elevation: 5,
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          child: Padding(
                              padding: const EdgeInsets.all(6),
                              child: FittedBox(
                                  child: Text('${transactions[index].price}'))),
                        ),
                        title: Text(transactions[index].item),
                        subtitle: Text(DateFormat.yMMMd()
                            .format(transactions[index].date)),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          color: Theme.of(context).errorColor,
                          onPressed: () => deletetx(transactions[index].id),
                        ),
                      ),
                    );
                  },
                  itemCount: transactions.length,
                )),
    );
  }
}
