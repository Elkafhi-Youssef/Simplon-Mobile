import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // ignore: prefer_const_constructors
          title: Text(
            "Log in",
            // ignore: prefer_const_constructors
            style: TextStyle(
                fontSize: 30,
                fontFamily: "firstfont",
                fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue[500],
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            
            children: [
              Container(
                margin: EdgeInsets.all(30),
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                  'assets/img/83168-login-success.gif',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(66),
                ),
                width: 266,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: Colors.blue[800],
                      ),
                      hintText: "Your Email :",
                      border: InputBorder.none),
                ),
              ),
              const SizedBox(
                height: 23,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(66),
                ),
                width: 266,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      suffix: Icon(
                        Icons.visibility,
                        color: Colors.blue[900],
                      ),
                      icon: Icon(
                        Icons.lock,
                        color: Colors.blue[800],
                        size: 19,
                      ),
                      hintText: "Password :",
                      border: InputBorder.none),
                ),
              ),
              const SizedBox(
                height: 17,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
                      horizontal: 106, vertical: 10)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(27))),
                ),
                child: const Text(
                  "login",
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ],
          ),
        ));
  }
}
