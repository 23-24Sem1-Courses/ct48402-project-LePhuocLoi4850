import 'package:flutter/material.dart';
import 'package:myshop/ui/cart/cart_manager.dart';
import 'package:provider/provider.dart';
import '../../models/cart_item.dart';
import '../shared/dialog_utils.dart';

class CartItemCart extends StatelessWidget {
  final String productId;
  final CartItem cardItem;

  const CartItemCart({
    required this.productId,
    required this.cardItem,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(cardItem.id),
      background: Container(
        color: Theme.of(context).colorScheme.error,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showConfirmDialog(
          context,
          'Bạn có muốn xóa sản phẩm này không?',
        );
      },
      onDismissed: (direction) {
        context.read<CartManager>().clearItem(productId);
      },
      child: buildItemCard(),
    );
  }

  Widget buildItemCard() {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      child: SizedBox(
        height: 108,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(0),
              child: Image.network(
                cardItem.img,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
                scale: 4.0,
              ),
            ),
            title: Text(
              cardItem
                  .title, // Wrap the title in a Text widget and set the fontSize parameter
              style: const TextStyle(fontSize: 20.0, fontFamily: 'arial'),
            ),
            subtitle: Text(
              '\$${(cardItem.price * cardItem.quantity)}', // Wrap the subtitle in a Text widget and set the fontSize parameter
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'arial',
                color: Colors.green,
              ),
            ),
            trailing: Text(
              '${cardItem.quantity} x', // Wrap the trailing in a Text widget and set the fontSize parameter
              style: const TextStyle(fontSize: 16.0, fontFamily: 'arial'),
            ),
          ),
        ),
      ),
    );
  }
}
