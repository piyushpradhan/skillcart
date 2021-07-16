import 'package:hive/hive.dart';

part 'item.g.dart';

@HiveType(typeId: 1)
class Item {
  @HiveField(0)
  final String itemName;
  @HiveField(1)
  final double price;
  @HiveField(2)
  final String seller;

  const Item({
    required this.itemName,
    required this.price,
    required this.seller,
  });
}
