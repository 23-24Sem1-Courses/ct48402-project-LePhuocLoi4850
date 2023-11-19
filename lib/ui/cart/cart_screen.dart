import 'package:flutter/material.dart';
import 'package:myshop/ui/orders/order_manager.dart';
import 'package:provider/provider.dart';
import 'cart_manager.dart';
import 'cart_item_card.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print('building orders');
    final cart = context.watch<CartManager>();
    // ignore: unused_local_variable
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giỏ Hàng'),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 10),
          Expanded(
            child: buildCartDetails(cart),
          ),
          buildCartScreen(cart, context),
        ],
      ),
    );
  }

  Widget buildCartDetails(CartManager cart) {
    return ListView(
      children: cart.productEntries
          .map(
            (entry) => CartItemCart(
              productId: entry.key,
              cardItem: entry.value,
            ),
          )
          .toList(),
    );
  }

  Widget buildCartScreen(CartManager cart, BuildContext context) {
    if (cart.productEntries.isEmpty) {
      // Thêm dòng text khi không có đơn hàng nào
      return Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 380),
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 0),
                child: Text(
                  'Giỏ Hàng Trống',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  // Quay lại trang chủ
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text('Quay Lại',
                    style: TextStyle(
                      color: Colors.red,
                    )),
              ),
            ],
          ),
        ),
      );
    } else {
      return Card(
        margin: const EdgeInsets.all(15),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                'Tổng thanh toán',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'arial',
                ),
              ),
              const Spacer(),
              Chip(
                label: Text(
                  '\$${cart.totalAmount.toStringAsFixed(2)}',
                  style: const TextStyle(
                      color: Color.fromARGB(255, 0, 177, 63),
                      fontSize: 24,
                      fontFamily: 'arial',
                      backgroundColor:
                          Color.fromARGB(255, 255, 255, 255)),
                ),
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              ),
              TextButton(
                onPressed: cart.totalAmount <= 0
                    ? null
                    : () {
                        context.read<OrdersManager>().addOrder(
                              cart.products,
                              cart.totalAmount,
                            );
                        cart.clearAllItems();
                      },
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 0, 177, 63),
                ),
                child: const Text(
                  'Đặt Hàng',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'arial',
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
