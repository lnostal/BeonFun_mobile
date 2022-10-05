// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_beonfun/pages/root_pages/tabbar_page.dart';
import 'package:flutter_beonfun/net/general_network.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _loginTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  bool error = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('✨ Beon.Fun ✨', style: TextStyle(fontSize: 32)),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 32, top: 10, right: 32, bottom: 10),
            child: TextField(
              style: TextStyle(
                  color: Theme.of(context).textTheme.bodyMedium!.color),
              controller: _loginTextController,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                  labelText: 'Login',
                  errorText: error ? 'Неверно введены логин или пароль' : null),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 32, top: 10, right: 32, bottom: 10),
            child: TextField(
              style: TextStyle(
                  color: Theme.of(context).textTheme.bodyMedium!.color),
              controller: _passwordTextController,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: 'Password', errorText: error ? '' : null),
            ),
          ),
          TextButton(
              onPressed: singIn,
              child: const Text(
                'Sign in',
                style: TextStyle(fontSize: 16),
              ))
        ],
      ),
    );
  }

  void singIn() {
    Request()
        .login(_loginTextController.text, _passwordTextController.text)
        .then(
      (value) async {
        var prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', value);
        Request().getUserInfo();
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const TabBarPage()));
      },
    ).onError((error, stackTrace) {
      setError();
    });
  }

  void setError() {
    setState(() {
      error = !error;
    });
  }
}

class FlatButton {}
