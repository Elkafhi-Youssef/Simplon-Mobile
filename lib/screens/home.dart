import 'dart:math';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:simplonline/auth.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().singOut();
  }

  Widget _userUid() {
    return  Text(user?.email ?? 'User email');
  }

   Widget _title() {
    return  Text('FireBase Auth');
  }
  Widget _signOutButton() {
    return  ElevatedButton(onPressed: signOut, child: const Text('sign out'));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: Container(height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _userUid(),
          _signOutButton()
        ],
      ),),
    );
  }
}
