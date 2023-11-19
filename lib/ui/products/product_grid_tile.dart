import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:myshop/ui/cart/cart_manager.dart';
import 'package:provider/provider.dart';
import '../../models/product.dart';
import 'product_detail_screen.dart';
import '../products/products_manager.dart';

class ProductGirdTile extends StatelessWidget {
  const ProductGirdTile(
    this.product, {
    super.key,
    required int height,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: buildGridFooterBar(context),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 241, 241, 241),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ClipRRect(
                clipBehavior: Clip.hardEdge,
                child: Stack(
                  children: [
                    Row(
                      children: [
                        // Ảnh và title nằm trên cùng hàng
                        Expanded(
                          child: Row(
                            children: [
                              Container(
                                height: 110,
                                width: 150,
                                padding: const EdgeInsets.only(top: 10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      10.0), // Apply border radius to image
                                  child: Image.network(
                                    product.imageUrl,
                                    fit: BoxFit
                                        .cover, // Fit the image to the container
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  product.title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    fontFamily: 'Helvetica',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      height: 40,
                      width: 40,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              10), // Apply border radius to container
                          color: const Color.fromARGB(
                              255, 55, 164, 60), // Set background color to blue
                        ),
                        padding: const EdgeInsets.all(
                            0.5), // Add padding to the icon

                        child: IconButton(
                          icon: const Icon(Icons.add),
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
                          color: Colors.white, // Set icon color to white
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildGridFooterBar(BuildContext context) {
    return GridTileBar(
      leading: ValueListenableBuilder<bool>(
        valueListenable: product.isFavoriteListenable,
        builder: (ctx, isFavorite, child) {
          return IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
            ),
            color: Theme.of(context).colorScheme.secondary,
            onPressed: () {
              ctx.read<ProductsManager>().toggleFavoritesStatus(product);
            },
            alignment: Alignment
                .bottomLeft, // Align the icon to the bottom left corner
            padding: EdgeInsets.zero, // Reset padding to 0
          );
        },
      ),
    );
  }
}
