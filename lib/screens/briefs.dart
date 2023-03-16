import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:simplonline/screens/brief.dart';


class BriefsList extends StatefulWidget {
  const BriefsList({super.key});

  @override
  State<BriefsList> createState() => _BriefsListState();
}

class _BriefsListState extends State<BriefsList> {

  List briefs = [];
  getBriefOfPromo() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot = await firestore
        .collection('briefs')
        .where('idPromo', isEqualTo: "7ZtYbt8G44mG205OIVnM")
        .get();

    querySnapshot.docs.forEach((document) {
      print(document['briefName']);
      setState(() {
        briefs.add(document.data());
      });
    });
    print(briefs);
  }

  @override
  void initState() {
    getBriefOfPromo();

    // getUser();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

       appBar: AppBar(
        title: const Text("Briefs", style: TextStyle(color: Colors.white)),
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
      body:
       ListView.builder(
          itemCount: briefs.length,
          itemBuilder: (context, i) {

            // QueryDocumentSnapshot<Object?> data = briefs[i];
            return GestureDetector(
              onTap: () {
                print(briefs[i]);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => briefDetails(data:briefs[i]),
                        ),
                    );
              },
                    child: Container(
                        width: MediaQuery.of(context).size.width - 90,
                        margin: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                        child: Center(
                          child: Column(
                            children: [
                              Image.asset(briefs[i]['image']),
                              Container(
                                color: Colors.white,
                                width: double.infinity,
                                padding: const EdgeInsets.all(15),
                                child: Column(children: const [
                                  Text(
                                  'CVThèque',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                // ignore: unnecessary_const
                                const Text(
                                  'brief mini description',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                ],)
                              ),
                            ],
                          )
                        )),
                  )
                    ;
          }),
    );
  }
}
