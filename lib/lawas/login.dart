import 'package:flutter/material.dart';
import 'package:uas_prakmobile/navigation.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _WelcomeState();
}

class _WelcomeState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/welcome.jpeg",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // const Spacer(),
                    // SizedBox(height: 450),
                    const Text(
                      "Login Page",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 30),
                    Text('Username',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        )),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: TextField(
                        controller: _usernameController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Text('Password',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        )),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Login button
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const bottomNav(),
                          ),
                        );
                      },
                      child: Container(
                        height: 55,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Image.asset(
                            //   "assets/icons",
                            //   height: 30,
                            //   width: 30,
                            // ),
                            SizedBox(width: 10),
                            Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.height * 0.06),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
