import 'package:flutter/material.dart';
import 'package:flutter_demo_uygulama/home/viewModel/resource_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final String _titleText = "Giriş Formu";
  final String _loginText = "Giriş";

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Wrap(
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: [
                Text(
                  _titleText,
                  style: Theme.of(context).textTheme.headline3,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Kullanıcı Adı"),
                  controller: _usernameController,
                  textInputAction: TextInputAction.next,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Parola"),
                  controller: _passwordController,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                ),
                _loginButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ElevatedButton _loginButton(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black87,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            FocusManager.instance.primaryFocus?.unfocus();
            context.read<ResourceProvider>().login(
                context,
                _usernameController.text.trim(),
                _passwordController.text.trim());
          }
        },
        child: Text(_loginText));
  }
}
