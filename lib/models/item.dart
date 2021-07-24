import 'package:hive/hive.dart';
import 'package:skillcart/models/products.dart';

part 'item.g.dart';

@HiveType(typeId: 1)
class Item {
  @HiveField(0)
  final Product product;
  @HiveField(1)
  int quantity;

  Item({
    required this.product,
    this.quantity = 1,
  });
}
