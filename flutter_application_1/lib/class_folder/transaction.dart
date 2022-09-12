class Transaction {
  late final String id;
  final String item;
  final double price;
  final DateTime date;
  
  Transaction(
      {required this.id,
      required this.item,
      required this.price,
      required this.date});

}
