import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 var mypassword, myemail;
  GlobalKey<FormState> _formstate = new GlobalKey<FormState>();
  signIn() async {
    var formdata = _formstate.currentState;
    if (_formstate.currentState != null &&
        _formstate.currentState!.validate()) {
      formdata?.save();
      try {
        // showLoading(context);
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: myemail, password: mypassword);
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          // Navigator.of(context).pop();
          AwesomeDialog(
              context: context,
              title: "Error",
              body: Text("No user found for that email"))
            ..show();
        } else if (e.code == 'wrong-password') {
          Navigator.of(context).pop();
          AwesomeDialog(
              context: context,
              title: "Error",
              body: Text("Wrong password provided for that user"))
            ..show();
        }
      }
    } else {
      print("Not Vaild");
    }
  }


  @override
  Widget build(BuildContext context) {

     return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.asset("assets/img/83168-login-success.gif",width: 300,height: 300)),
            Container(
              padding: EdgeInsets.all(20),
              child: Form(
                  key: _formstate,
                  child: Column(
                    children: [
                      TextFormField(
                        onSaved: (val) {
                          myemail = val;
                        },
                        // validator: (val) {
                        //   if (val.length > 100) {
                        //     return "Email can't to be larger than 100 letter";
                        //   }
                        //   return null;
                        // },
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            hintText: "Email",
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
                              Text("if you havan't accout "),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushReplacementNamed("signup");
                                },
                                child: Text(
                                  "Click Here",
                                  style: TextStyle(color: Colors.deepOrangeAccent),
                                ),
                              )
                            ],
                          )),
                      Container(
                          child: ElevatedButton(

                        
                        onPressed: () async {
                          var user = await signIn();
                          if (user != null) {
                            Navigator.of(context)
                                .pushReplacementNamed("homepage");
                          }
                        },
                        child: Text(
                          "Sign in",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        style: ElevatedButton.styleFrom(
                primary: Colors.deepOrangeAccent,),
                      ),),
                      
                    ],
                  )),
            )
          ],
        ),
      ),
    );
    
  }  
}
