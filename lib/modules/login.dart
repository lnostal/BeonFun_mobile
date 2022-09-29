import 'package:flutter/material.dart';
import 'package:flutter_beonfun/modules/main_tabbar/main_tabbar.dart';
import 'package:flutter_beonfun/network/general_network.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              controller: _loginTextController,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Login',
                  errorText: error ? 'Неверно введены логин или пароль' : null),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 32, top: 10, right: 32, bottom: 10),
            child: TextField(
              controller: _passwordTextController,
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Password',
                  errorText: error ? '' : null),
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

        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const MainTabBar()));
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
