import 'package:flutter/material.dart';
import 'package:flutter_demo_uygulama/home/view/sepet_view/sepet_container_widget.dart';
import 'package:flutter_demo_uygulama/home/view/products_view/products_tabbar_view.dart';
import 'package:provider/provider.dart';
import '../viewModel/resource_provider.dart';
import 'category_view/categories_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: context.read<ResourceProvider>().fetch(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return DefaultTabController(
                length: context.watch<ResourceProvider>().categories.length,
                child: Column(
                  children: [
                    const HomePageTopCard(),
                    ProductsTabBarView(
                        categories:
                            context.watch<ResourceProvider>().categories)
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("Something is wrong"),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class HomePageTopCard extends StatelessWidget {
  const HomePageTopCard({super.key});

  @override
  Widget build(BuildContext context) {
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
              const SepetContainerWidget(isClickable: true),
              Text(
                context.watch<ResourceProvider>().currentUser?.name ??
                    "Default Name",
                style: const TextStyle(fontSize: 36),
              ),
              CategoriesBar(
                  categories: context.watch<ResourceProvider>().categories)
            ],
          ),
        ),
      ),
    );
  }
}
