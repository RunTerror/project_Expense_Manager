import 'package:flutter/material.dart';
import './widgets/new_transaction.dart';
import './widgets/transactionlist.dart';
import './class_folder/transaction.dart';
import './widgets/chart.dart';

void main() => runApp(_MyHomePage());

class _MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.yellow,
          fontFamily: 'Quicksand',
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                    headline6: const TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
          )),
      debugShowCheckedModeBanner: false,
      home: _MyApp(),
    );
  }
}

class _MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<_MyApp> {
  final List<Transaction> _usertransaction = [
    // Transaction(
    //   id: "1",
    //   item: "Water Bottle",
    //   price: 700,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: '2',
    //   item: "Headphone",
    //   price: 3000,
    //   date: DateTime.now(),
    // ),
  ];

  List<Transaction> get _recentTransaction {
    return _usertransaction.where((Tx) {
      return Tx.date.isAfter(
        DateTime.now().subtract(Duration(days: 7)),
      );
    }).toList();
  }

  void _addnewtransaction(String txTitle, double txprice, DateTime chosenDate) {
    final newtx = Transaction(
      id: DateTime.now().toString(),
      item: txTitle,
      price: txprice,
      date: chosenDate,
    );
    setState(() {
      _usertransaction.add(newtx);
    });
  }

  void _startAddnewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(_addnewtransaction);
        });
  }
  void deleteTx(String id){
    setState(() {
      _usertransaction.removeWhere((element) => element.id==id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Center(
          child: Text(
            "DAILY EXPENSE💰",
            style: TextStyle(fontFamily: 'Open Sans'),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _startAddnewTransaction(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // ignore: sized_box_for_whitespace
            Chart(_recentTransaction),
            TransactionList(_usertransaction, deleteTx),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        elevation: 5,
        onPressed: () => _startAddnewTransaction(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
