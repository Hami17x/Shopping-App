import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_uygulama/home/model/product_model.dart';
import 'add_product_container.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({super.key, required this.productModel});
  final ProductModel productModel;
  final double _height = 130;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          height: _height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(productModel.name),
                  Text(
                    "${productModel.price} TL",
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  AddProductContainer(product: productModel)
                ],
              ),
              CachedNetworkImage(
                width: 100,
                imageUrl: productModel.photo,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
