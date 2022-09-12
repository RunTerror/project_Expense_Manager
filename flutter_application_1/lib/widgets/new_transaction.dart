// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addtx;
  NewTransaction(this.addtx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titlecontroller = TextEditingController();

  final pricecontroller = TextEditingController();
  DateTime selectDate = DateTime.now();

  void submitData() {
    if (titlecontroller.text.isEmpty) {
      return;
    }
    final enteredtitle = titlecontroller.text;
    final enteredprice = double.parse(pricecontroller.text);
    if (enteredtitle.isEmpty || enteredprice <= 0 || selectDate == null) {
      return;
    }
    widget.addtx(
      titlecontroller.text,
      double.parse(pricecontroller.text),
      selectDate,
    );
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        selectDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(labelText: 'title'),
              // onChanged: (value)=> titleinput=value,
              controller: titlecontroller,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'amount'),
              // onChanged: (value)=> priceinput=value,
              controller: pricecontroller,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => submitData(),
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(selectDate == null
                        ? 'No date chosen!'
                        : DateFormat.yMd().format(selectDate)),
                  ),
                  FlatButton(
                      onPressed: _presentDatePicker,
                      child: Text(
                        "chose date",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                      )),
                ],
              ),
            ),
            RaisedButton(
              color: Theme.of(context).primaryColor,
              onPressed: submitData,
              child: Text(
                "Add Transaction",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
