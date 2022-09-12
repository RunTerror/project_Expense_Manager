import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transactionlist.dart';
import '../class_folder/transaction.dart';

class _UserTransaction extends StatefulWidget {
  @override
  State<_UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<_UserTransaction> {
  
  

  
 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        // NewTransaction(_addnewtransaction),
        // TransactionList(_usertransaction),
      ],
    );
  }
}
