import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:simplonline/models/briefs.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Object? promo;
  getUser() {
    var user = FirebaseAuth.instance.currentUser;
    print(user?.email);
  }

  getPromoInfo() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot = await firestore.collection('promo').get();
    
    querySnapshot.docs.forEach((document) {
      setState(() {
        promo = document.data();
      });
    });
    print(promo);
    print("==========================================");
  }

  @override
  void initState() {
    getPromoInfo();

    getUser();
    super.initState();
  }

  _buildBrief(String briefImg, String briefTitle, String briefType) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black38, width: 1),
          borderRadius: BorderRadius.circular(10)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Image.asset(briefImg, width: 200, height: 200, fit: BoxFit.cover),
        Container(
          child: Text(
            briefTitle,
            style: TextStyle(
              fontFamily: "firstfont",
              fontSize: 16,
            ),
            textAlign: TextAlign.start,
          ),
        ),
        Container(
          child: Text(briefType),
          margin: EdgeInsets.fromLTRB(5, 10, 0, 0),
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
backgroundColor: Colors.deepOrangeAccent,
        title: const Text("Simplone", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed("homepage");
          },
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.assignment_outlined),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushReplacementNamed("birefs");
              }),
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushReplacementNamed("login");
              }),
        ],
      ),
      body:StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('promo').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text('Loading');
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data() as Map<String, dynamic>;
              return  Center(
          
          child: 
              Container(
                margin: EdgeInsets.fromLTRB(10, 50, 10, 0),
                width: double.infinity,
                child: Column(children: [
                  Container(
                    child: Image.asset(data['image'],
                        width: double.infinity, height: 200, fit: BoxFit.cover),
                  ),
                  
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            margin: EdgeInsets.all(8),
                            child: Text(data['name'],
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: "firstfont",
                                    fontWeight: FontWeight.w500)),
                          ),
                          Container(
                            margin: EdgeInsets.all(8),
                            child:  Text(data['numberOfStudents']+" apprenants",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: "firstfont",
                                    fontWeight: FontWeight.w500)),
                          ),
                          Container(
                            margin: EdgeInsets.all(8),
                            child: const Text(
                              "2022/2023",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "firstfont",
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                  
                ]),
              ),
            );
            }).toList(),
          );
   },),
);
  }
}
