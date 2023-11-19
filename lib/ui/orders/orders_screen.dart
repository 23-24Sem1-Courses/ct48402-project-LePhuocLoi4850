import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'order_manager.dart';
import 'order_item_card.dart';
import '../shared/app_drawer.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print('building orders');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Đơn Hàng'),
      ),
      drawer: const AppDrawer(),
      body: Consumer<OrdersManager>(
        builder: (ctx, ordersManager, child) {
          if (ordersManager.orderCount == 0) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Bạn không có đơn hàng nào.',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'arial'),
                  ),
                ],
              ),
            );
          } else {
            return ListView.builder(
              itemCount: ordersManager.orderCount,
              itemBuilder: (ctx, i) => OrderItemCard(ordersManager.orders[i]),
            );
          }
        },
      ),
    );
  }
}
