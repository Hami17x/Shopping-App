import 'package:flutter/material.dart';
import 'package:flutter_demo_uygulama/login/view/login_page.dart';
import 'package:flutter_demo_uygulama/home/viewModel/resource_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home/view/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("token");
  runApp(MultiProvider(builder: (context, child) => const MyApp(), providers: [
    ChangeNotifierProvider(
      create: (context) => ResourceProvider(token),
    ),
  ]));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: context.watch<ResourceProvider>().token == null
            ? const LoginPage()
            : const HomePage());
  }
}
