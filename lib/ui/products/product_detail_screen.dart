import 'package:flutter/material.dart';
import 'package:myshop/ui/cart/cart_manager.dart';
// ignore: unused_import
import 'package:myshop/ui/cart/cart_screen.dart';
import 'package:provider/provider.dart';
import '../../models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';
  const ProductDetailScreen(
    this.product, {
    super.key,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          buildShareIcon(),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            OverlaidProductInfo(
              imageUrl: product.imageUrl,
              price: product.price,
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              width: 350,
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color:
                        const Color.fromARGB(255, 93, 93, 93).withOpacity(0.5),
                    blurRadius: 10,
                    offset: const Offset(0, 10),
                  ),
                ],
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(255, 255, 255, 255)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Transform(
                // Translate the child by 10 pixels up
                transform: Matrix4.translationValues(0, 0, 0),
                child: Container(
                  // Add inner Container
                  margin: const EdgeInsets.only(
                      top: 5), // Adjust top margin of the inner container to 10
                  padding: const EdgeInsets.only(
                      top: 5), // Apply padding to the inner Container
                  child: Column(
                    children: [
                      Text(
                        product.title,
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'arial'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        height: 1,
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Text(
                          product.description,
                          style: const TextStyle(
                            fontFamily: 'arial',
                          ),
                          textAlign: TextAlign.left,
                          softWrap: true,
                        ),
                      ),
                      const Divider(
                        height: 2,
                        color: Colors.black,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Text(
                          'Giảm 10% khi mua 3 sản phẩm trở lên',
                          style: TextStyle(
                            fontSize: 14,
                            // fontWeight: FontWeight.bold,
                            fontFamily: 'arial',
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ),
                      const Divider(
                        height: 1,
                        color: Colors.black,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Text(
                          'Tặng ngay 1 ly trà sửa khi mua 5 sản phẩm',
                          style: TextStyle(
                            fontSize: 14,
                            // fontWeight: FontWeight.bold,
                            fontFamily: 'arial',
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.symmetric(horizontal: 30),
              width: 350,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  width: 1,
                ),
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(255, 255, 255, 255)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 0),
              padding: const EdgeInsets.symmetric(horizontal: 30),
              width: 350,
              height: 20,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  width: 1,
                ),
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(255, 255, 255, 255)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            Container(
              width: 300,
              height: 50,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 82, 239, 82),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 123, 123, 123)
                        .withOpacity(0.5),
                    blurRadius: 10,
                    offset: const Offset(0, 10),
                  ),
                ],
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 82, 239, 82),
                    Color.fromARGB(255, 82, 239, 85)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              alignment: Alignment.bottomCenter,
              child: TextButton(
                onPressed: () {
                  final cart = context.read<CartManager>();
                  cart.addItem(product);
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        content: const Text(
                          'Thêm vào giỏ hàng thành công',
                        ),
                        duration: const Duration(seconds: 2),
                        action: SnackBarAction(
                          label: 'UNDO',
                          onPressed: () {
                            cart.removeItem(product.id!);
                          },
                        ),
                      ),
                    );
                },
                child: const Text('Thêm vào giỏ hàng',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OverlaidProductInfo extends StatelessWidget {
  const OverlaidProductInfo({
    super.key,
    required this.imageUrl,
    required this.price,
  });

  final String imageUrl;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          imageUrl,
          height: 340,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            color: const Color.fromARGB(146, 33, 33, 33).withOpacity(0.7),
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      // ignore: unnecessary_brace_in_string_interps
                      '\$${price}',
                      style: const TextStyle(
                          color: Colors.green,
                          fontSize: 40,
                          fontFamily: 'arial',
                          fontWeight: FontWeight.bold),
                    ),
                    // Icon(
                    //   Icons.star,
                    //   color: Colors.yellow,
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Widget buildShareIcon() {
  return IconButton(
    icon: const Icon(
      Icons.share,
    ),
    onPressed: () {
      // Implement share functionality
    },
  );
}
