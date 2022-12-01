import 'package:flutter/material.dart';
import 'package:flutter_demo_uygulama/home/model/product_model.dart';
import 'package:flutter_demo_uygulama/home/view/products_view/products_container.dart';
import 'package:flutter_demo_uygulama/home/view/sepet_view/sepet_container_widget.dart';

import 'package:provider/provider.dart';

import '../../viewModel/resource_provider.dart';

class SepetPage extends StatefulWidget {
  const SepetPage({super.key});

  @override
  State<SepetPage> createState() => _SepetPageState();
}

class _SepetPageState extends State<SepetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _sepetTopCard(context),
            _sepetekkiUrunler(context.watch<ResourceProvider>().addedProducts)
          ],
        ),
      ),
    );
  }

  Widget _sepetTopCard(BuildContext context) {
    final height = MediaQuery.of(context).size.height / 3;
    return Card(
      margin: EdgeInsets.zero,
      child: SizedBox(
        height: height,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back)),
                  const SepetContainerWidget(isClickable: false),
                ],
              ),
              Text(
                context.watch<ResourceProvider>().currentUser?.name ??
                    "Default Name",
                style: const TextStyle(fontSize: 36),
              ),
              Text(
                "Sepetim \nTutar: ${context.watch<ResourceProvider>().tutar.toStringAsFixed(2)} TL",
                style: Theme.of(context).textTheme.headline5,
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded _sepetekkiUrunler(List<ProductModel> products) {
    return Expanded(
      child: ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return ProductContainer(productModel: products[index]);
        },
      ),
    );
  }
}
