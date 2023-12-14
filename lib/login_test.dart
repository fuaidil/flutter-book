import 'package:flutter/material.dart';
import 'package:uas_prakmobile/navigation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _showEmptyFieldsAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Alert"),
          content: const Text("Username and password cannot be empty."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Baca Buku Apa Hari Ini ?",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.blueAccent,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      labelStyle: TextStyle(color: Colors.blueAccent),
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.blueAccent),
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      if (_usernameController.text.isEmpty ||
                          _passwordController.text.isEmpty) {
                        _showEmptyFieldsAlert();
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => bottomNav(),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      primary: Colors.blueAccent,
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Divider(
                          thickness: 2,
                          color: Colors.black.withAlpha(70),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          "Login Dengan",
                          style: TextStyle(color: Colors.black.withAlpha(150)),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 2,
                          color: Colors.black.withAlpha(70),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        'assets/icons/fb.png',
                        height: 50,
                        width: 50,
                      ),
                      Image.network(
                        'https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png',
                        height: 50,
                        width: 50,
                      ),
                      Image.asset(
                        'assets/icons/twitter.png',
                        height: 50,
                        width: 50,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
