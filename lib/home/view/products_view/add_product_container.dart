import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/product_model.dart';
import '../../viewModel/resource_provider.dart';

class AddProductContainer extends StatefulWidget {
  final ProductModel product;
  const AddProductContainer({super.key, required this.product});

  @override
  State<AddProductContainer> createState() => _AddProductContainerState();
}

class _AddProductContainerState extends State<AddProductContainer> {
  final Size _containerSize = const Size(85, 40);
  final String _title = "Ekle";

  @override
  Widget build(BuildContext context) {
    return widget.product.numberOfAdded == 0
        ? _ekleButton(context)
        : _changeNumberButton(context);
  }

  SizedBox _changeNumberButton(BuildContext context) {
    return SizedBox(
      width: _containerSize.width,
      height: _containerSize.height,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              context.read<ResourceProvider>().urunCikar(widget.product);
            },
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
                  color: Colors.black),
              child: const Center(
                child: Icon(
                  Icons.remove,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.black38,
              child: Center(
                child: Text(
                  widget.product.numberOfAdded.toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              context.read<ResourceProvider>().urunEkle(widget.product);
            },
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  color: Colors.black),
              child: const Center(
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  InkWell _ekleButton(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<ResourceProvider>().urunEkle(widget.product);
      },
      child: Container(
        width: _containerSize.width,
        height: _containerSize.height,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.black87),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.add,
              color: Colors.white,
            ),
            Text(
              _title,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
