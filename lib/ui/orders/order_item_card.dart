import 'dart:math';

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:intl/intl.dart';

import '../../models/order_item.dart';

class OrderItemCard extends StatefulWidget {
  final OrderItem order;
  const OrderItemCard(this.order, {super.key});
  @override
  State<OrderItemCard> createState() => _OrderItemCardState();
}

class _OrderItemCardState extends State<OrderItemCard> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          buildOrderSummary(),
          if (_expanded) buildOrderDetails()
        ],
      ),
    );
  }

  Widget buildOrderDetails() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      height: min(widget.order.productCount * 20.0 + 50, 200),
      child: ListView(
        children: widget.order.products
            .map((prod) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(prod.title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${prod.quantity}',
                          style: const TextStyle(
                              fontSize: 18,
                              color: Colors.green,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 20),
                        Text(
                          '\$${prod.price}',
                          style: const TextStyle(
                              fontSize: 18,
                              color: Colors.green,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ))
            .toList(),
      ),
    );
  }

  Widget buildOrderSummary() {
    return ListTile(
      title: Text(
        '\$${widget.order.amount.toStringAsFixed(2)}',
        style: const TextStyle(
          color: Colors.green,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 3,
            child: Text(
              DateFormat('dd/MM/yyyy' ' ' ' hh:mm')
                  .format(widget.order.dateTime),
              style: const TextStyle(
                fontFamily: 'arial',
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          IconButton(
            icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
            onPressed: () {
              setState(() {
                _expanded = !_expanded;
              });
            },
          ),
        ],
      ),
    );
  }
}
