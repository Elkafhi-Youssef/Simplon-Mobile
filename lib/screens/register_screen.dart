import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Registre extends StatefulWidget {
  const Registre({super.key});

  @override
  State<Registre> createState() => _RegistreState();
}

class _RegistreState extends State<Registre> {
  var myusername, mypassword, myemail;
  // GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  GlobalKey<FormState> _formstate = GlobalKey<FormState>();
  signUp() async {
    var formdata = _formstate.currentState;
    if (_formstate.currentState != null &&
        _formstate.currentState!.validate()) {
      formdata?.save();

      try {
        // showLoading(context);
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: myemail, password: mypassword);
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          AwesomeDialog(
              context: context,
              title: "Error",
              body: Text("Password is to weak"))
            ..show();
        } else if (e.code == 'email-already-in-use') {
          // Navigator.of(context).pop();
          AwesomeDialog(
              context: context,
              title: "Error",
              body: Text("The account already exists for that email"))
            ..show();
        }
      } catch (e) {
        print(e);
      }
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 100),
          Center(
              child: Image.asset(
            "assets/img/83168-login-success.gif",
            width: 200,
            height: 200,
          )),
          Container(
            padding: EdgeInsets.all(20),
            child: Form(
                key: _formstate,
                child: Column(
                  children: [
                    TextFormField(
                      onSaved: (val) {
                        myusername = val;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: "username",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1))),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      onSaved: (val) {
                        myemail = val;
                      },
                      // validator: (val) {
                      //   if (val.length > 100) {
                      //     return "Email can't to be larger than 100 letter";
                      //   }
                      //   if (val.length < 2) {
                      //     return "Email can't to be less than 2 letter";
                      //   }
                      //   return null;
                      // },
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: "email",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1))),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      onSaved: (val) {
                        mypassword = val;
                      },
                      // validator: (val) {
                      //   if (val.length > 100) {
                      //     return "Password can't to be larger than 100 letter";
                      //   }
                      //   if (val.length < 4) {
                      //     return "Password can't to be less than 4 letter";
                      //   }
                      //   return null;
                      // },
                      obscureText: true,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: "password",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1))),
                    ),
                    Container(
                        margin: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Text("if you have Account "),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed("login");
                              },
                              child: Text(
                                "Click Here",
                                style: TextStyle(color: Colors.blue),
                              ),
                            )
                          ],
                        )),
                    Container(
                        child: ElevatedButton(
                      onPressed: () async {
                        UserCredential response = await signUp();
                        print("===================");
                        if (response != null) {
                          print("registere done now navigate to homw");
                          // await FirebaseFirestore.instance
                          //     .collection("users")
                          //     .add({"username": myusername, "email": myemail});
                          Navigator.of(context)
                              .pushReplacementNamed("homepage");
                        } else {
                          print("Sign Up Faild");
                        }  
                        print("===================");
                      },
                      child: Text(
                        "Sign Up",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ))
                  ],
                )),
          )
        ],
      ),
    );
  }
}
