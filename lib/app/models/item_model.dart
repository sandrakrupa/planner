import 'package:intl/intl.dart';

class ItemModel {
  ItemModel({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
  });

  final String id;
  final String title;
  final String description;
  final DateTime date;

  String dateFormated() {
    return DateFormat.yMMMEd().format(date);
  }
}
