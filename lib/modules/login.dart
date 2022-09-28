import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Login'),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 32, top: 10, right: 32, bottom: 10),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Password'),
            ),
          ),
          TextButton(
              onPressed: () {},
              child: const Text(
                'Sign in',
                style: TextStyle(fontSize: 16),
              ))
        ],
      ),
    );
  }
}

class FlatButton {}
