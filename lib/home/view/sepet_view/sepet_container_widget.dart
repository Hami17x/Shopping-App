import 'package:flutter/material.dart';
import 'package:flutter_demo_uygulama/home/view/sepet_view/sepet_page.dart';

import 'package:provider/provider.dart';

import '../../viewModel/resource_provider.dart';

class SepetContainerWidget extends StatelessWidget {
  final bool isClickable;
  const SepetContainerWidget({
    Key? key,
    required this.isClickable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isClickable
          ? () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SepetPage()));
            }
          : null,
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
            //height: 40,
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: Colors.black87),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.shopping_basket,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "${context.watch<ResourceProvider>().tutar.toStringAsFixed(2)} TL",
                  style: const TextStyle(fontSize: 24, color: Colors.white),
                ),
              ],
            )),
      ),
    );
  }
}
